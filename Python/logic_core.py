#File: Logic_core.py
#Author: Lucy Jenkins
#Description:
#   Provides a logic core to use the MPPT/battery charger platform
#   All functions in this file are purely logic level and hardware independent for ease of testing
#
#   This implementation focuses on a 2S LiPo battery.
#
#To do:
#   - Use second or third order dynamic to help follow curves in case the maximum power is falling rapidly
#             (system gets paralyzed for fast power falls - no better alpha can be detecte)
#   - Dynamically scale the alpha step for fast moving power targets
#             (system cannot move faster than the fixed alpha to follow the power point)
#   - Further the use of user interface peripherals
#   - Implement mitigation strategies to error handle

SYS_VAR = "sim"
#SYS_VAR = "board"

if SYS_VAR == "sim":
    #from data_acq_sim import *
    #from env_interactions_sim import *
    from env_sim import *
else:
    if SYS_VAR == "board":
        #from data_acq import *
        #from env_interactions import *
        from env import *

from time import sleep

##System constants
V_UC = 1.01*3.5 #undercharge voltage of lithium ion battery
V_OC = .99*4.2 #overcharge voltage of lithium ion battery

MIN_DUTY_CYCLE = .3       #Minimum duty cycle on the SMPS (to keep in operating region of SMPS)
DEFAULT_DUTY_CYCLE = .5   #Default duty cycle on the SMPS
MAX_DUTY_CYCLE = .75      #Maximum duty cycle on the SMPS (to keep in operating region of SMPS)
DUTY_CYCLE_STEP = .002    #Duty cycle step for the perturb and watch algorithm
DUTY_CYCLE_MAP_STEP = .05 #Large step for complete mapping of solar panel behaviour

MAX_I_BAT_IN = 1 #Maximum possible current on the system input (in amps)

MIN_WORKING_CURRENT = .01 #Minimum working current (in amps)

##System variables
alpha = DEFAULT_DUTY_CYCLE

##Environment variables
alpha_map = []
current_map = []


##Cost function for the calculation of how efficient an operating point is
def cost_function(target_current,actual_current):
    return abs(target_current - actual_current)

##Map the battery input currents in the allowable range of the SMPS's duty cycle
def map_current():
    global alpha_map, current_map
    
    alpha_map = []
    current_map = []
    
    a_low = int(MIN_DUTY_CYCLE/DUTY_CYCLE_MAP_STEP)
    a_high = int(MAX_DUTY_CYCLE/DUTY_CYCLE_MAP_STEP)
    
    for a in range(a_low,a_high+1):
        system_update(a*DUTY_CYCLE_MAP_STEP)
        alpha_map.append(a*DUTY_CYCLE_MAP_STEP)
        current_map.append(acq_i_bat_in())
    
    return 1

##Get the maximum of the mapped currents (search for the most likely candidate for global maximum power point)
#Returns:
#   The alpha for the maximum current
def current_map_get_max():
    global alpha_map, current_map
    
    alpha = DEFAULT_DUTY_CYCLE
    max_current = 0
    
    for i in range(0,len(current_map)):
        if current_map[i] > max_current:
            max_current = current_map[i]
            alpha = alpha_map[i]
            
    return alpha

## PPT algorithm to track a target current on the battery input sense resistor
def PPT_step(target_current):
    
    global alpha
    
    current = acq_i_bat_in()
    cost = cost_function(target_current,current)
    
    #Test with slightly lower duty cycle
    alpha_minus = alpha - DUTY_CYCLE_STEP
    current_minus = 0
    cost_minus = 1000
    if (alpha_minus > MIN_DUTY_CYCLE):
        system_update(alpha_minus)
        current_minus = acq_i_bat_in()
        cost_minus = cost_function(target_current, current_minus)

    #Test with slightly higher duty cycle
    alpha_plus = alpha + DUTY_CYCLE_STEP
    current_plus = 0
    cost_plus = 1000
    if (alpha_plus < MAX_DUTY_CYCLE):
        system_update(alpha_plus)
        current_plus = acq_i_bat_in()
        cost_plus = cost_function(target_current, current_plus)
        
    #Take a decision on best working point
    if (cost_minus < cost and cost_minus < cost_plus): #use this if better than the two others
        alpha = alpha_minus
    if (cost_plus < cost and cost_plus < cost_minus): #use this if better than the two others
        alpha = alpha_plus
    
    #Exploratory mode to look after a working power point
        #In case the current drops below 10 mA, we will explore all possible duty cycles to try to catch a working point
    #if (current_plus < .01) and (current < .01) and (current_minus < .01):
    #    alpha = alpha + DUTY_CYCLE_STEP
    #    if alpha > MAX_DUTY_CYCLE - 2*DUTY_CYCLE_STEP:
    #        alpha = MIN_DUTY_CYCLE + 2*DUTY_CYCLE_STEP
            
    #Exploratory mode to look after a working power point
        #In case the current drops below 10 mA, we will quicly map duty cycles to try to catch a working point
    if (current_plus < .01) and (current < .01) and (current_minus < .01):
        map_current()
        alpha = current_map_get_max()
    
    system_update(alpha)
    
    return 1



##Reduce the efficiency of the solar panel until we are within safe limits for battery (no overcharge)
def overcharge_handle():
    global alpha
    
    #print("overcharge_handle")
    
    if (i_bat_in > i_bat_out) and ((alpha + DUTY_CYCLE_STEP) < MAX_DUTY_CYCLE): #reduce efficiency of solar panel until battery slightly discharges
        alpha = alpha + DUTY_CYCLE_STEP
        system_update(alpha)
        
    if i_bat_in < .95*i_bat_out: #try to keep the battery charged but under safe conditions
        MPPT_step()
    
    return 1

##Error handling function (TBD)
def error_handle():
    
    major_problem(3)
    
    return 1

##Function to correct unexpeted errors
#    Floating point inacuracies
#    Unexpected value on alpha
def failsafe():
    global alpha
    
    alpha = int(alpha*1000)/1000 #correction for floating point inacuracies
    
    if alpha < MIN_DUTY_CYCLE: #correction for alpha below allowable minimum
        alpha = MIN_DUTY_CYCLE+5*DUTY_CYCLE_STEP
        
    if alpha > MAX_DUTY_CYCLE: #correction for duty cycle above maximum
        alpha = MAX_DUTY_CYCLE-5*DUTY_CYCLE_STEP
    
    return 1
    


##Initialization of the core
#  1- Start up system at default duty cycle
#  2- Draw a quick map of the PV behaviour to try to converge to true maximum

def init():
    global alpha
    
    #Init system with a default duty cycle as the starting parameter to start up function
    system_update(alpha)
    
    #Pause to allow system to start up
    if SYS_VAR == "board":
        sleep(.5)
    
    #Search once for the most likely candidate at the best duty cycle
    map_current()
    alpha = current_map_get_max()
    
    #Change system to the best candidate
    system_update(alpha)
    
    return 1

##Main program loop of the logic core
def run():
    
    #Acquisition loop
    v_c1 = acq_v_c1()
    v_c2 = acq_v_c2()
    
    i_bat_out = acq_i_bat_out()
    
    ##Target current determination
    target_current = 0
    if (v_c1 >= V_UC and v_c1 < V_OC and v_c2 >= V_UC and v_c2 < V_OC): ##Charge at maximum intensity
        target_current = MAX_I_BAT_IN + i_bat_out
    else:
        if (v_c1 >= V_OC or v_c2 >= V_OC) : ##Do not overcharge a cell
            target_current = i_bat_out
            
        else:
            ##A problem must be handled and signaled
            error_handle()
            
    ##Next tracking step in program
    PPT_step(target_current)

    #Other functions to ensure program will keep running in expected conditions
    failsafe()



##Main program
if __name__ == '__main__':
    
    #Initialize system
    init()
    
    #Run a given amount of loops for simulation
    if SYS_VAR == "sim":
        for i in range(0,500):
            run()
    
    
    #Run infinitely for on board release
    if SYS_VAR == "board":
        while True:
            try:
                run()
            except:
                error_handle()

