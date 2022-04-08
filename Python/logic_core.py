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

##System constants
V_UC = 1.01*3.5 #undercharge voltage of lithium ion battery
V_OC = .99*4.2 #overcharge voltage of lithium ion battery

BUFFER_SIZE = 16 #buffer size for the digital low pass filter (FIR)
FIR_COEF = [-0.003471,-0.004851,-0.004245,
            0.008891,0.044237,0.100233,
            0.160100,0.199106,0.199106,0.160100,
            0.100233,0.044237,0.008891,
            -0.004245,-0.004851,-0.003471] #digital low pass (FIR) => one low pass fits all

MIN_DUTY_CYCLE = .25 #Minimum duty cycle on the SMPS (to keep function of system)
DEFAULT_DUTY_CYCLE = .5 #Default duty cycle on the SMPS
MAX_DUTY_CYCLE = .75 #Maximum duty cycle on the SMPS (to keep function of system)
DUTY_CYCLE_STEP = .002 #Duty cycle step for the perturb and watch algorithm

MAX_I_BAT_IN = 1 #Maximum possible voltage on the system

##System variables
alpha = DEFAULT_DUTY_CYCLE

v_pv_buffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
v_c1_buffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
v_c2_buffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

i_pv_buffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
i_bat_in_buffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
i_bat_out_buffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

##Environment variables
v_pv = 0
v_c1 = 0
v_c2 = 0

i_pv = 0
i_bat_in = 0
i_bat_out = 0

##Digital low pass filter for data input clean_up (see if this feature is useful)
def FIR_filter(coef,buffer,data_in):
    data_out = 0
    
    for i in range(0,BUFFER_SIZE-1):
        buffer[i] = buffer[i+1]
    buffer[BUFFER_SIZE-1] = data_in
    
    for i in range(0,BUFFER_SIZE):
        data_out = data_out + buffer[i]*FIR_COEF[i]
        
    return data_out

##Initialization of the core for program calculations
def init():
    #init system with a default duty cycle as the starting parameter
    system_update(alpha)
    
    #initialize buffers with the first value sensed by the system
    v_pv = acq_v_pv()
    v_c1 = acq_v_c1()
    v_c2 = acq_v_c2()
    i_pv = acq_i_pv()
    i_bat_in = acq_i_bat_in()
    i_bat_out = acq_i_bat_out()
    
    for i in range(0,BUFFER_SIZE):
        v_pv_buffer[i] = v_pv
        v_c1_buffer[i] = v_c1
        v_c2_buffer[i] = v_c2
        i_pv_buffer[i] = i_pv
        i_bat_in_buffer[i] = i_bat_in
        i_bat_out_buffer[i] = i_bat_out
        
    return 1

##Data acquisition step for main program loop (may need to be deleted)
def data_acquisition():
    global v_pv,v_c1,v_c2,i_pv,i_bat_in,i_bat_out
    global v_pv_buffer,v_c1_buffer,v_c2_buffer,i_pv_buffer,i_bat_in_buffer,i_bat_out_buffer
    
    #print("data_acquisition")
    
    v_pv = FIR_filter(FIR_COEF,v_pv_buffer,acq_v_pv())
    v_c1 = FIR_filter(FIR_COEF,v_c1_buffer,acq_v_c1())
    v_c2 = FIR_filter(FIR_COEF,v_c2_buffer,acq_v_c2())

    i_pv = FIR_filter(FIR_COEF,i_pv_buffer,acq_i_pv())
    i_bat_in = FIR_filter(FIR_COEF,i_bat_in_buffer,acq_i_bat_in())
    i_bat_out = FIR_filter(FIR_COEF,i_bat_out_buffer,acq_i_bat_out())
    
    return 1

##LEGACY##
##perturbation test for the MPPT algorithm used
#returns True if the new duty cycle provides more power than the old duty cycle
#returns False if the new duty cycle doesn't provide more power
def perturb_test(new_alpha,power):
    if (new_alpha > MIN_DUTY_CYCLE) and (new_alpha < MAX_DUTY_CYCLE):
        system_update(new_alpha)
        new_power = int(acq_v_pv() * acq_i_pv() * 1000)
    else:
        new_power = -1
    return new_power

##LEGACY##
##MPPT algorithm step by small perturbation
#We perturb the system by small increments to see in which direction it is preferable to go for maximum power
def MPPT_step():
    global alpha
    
    #print("MPPT_step")
    
    power = int(v_pv * i_pv * 1000) #current power to beat (mW)
    
    #test with slightly lower duty cycle
    alpha_minus = alpha - DUTY_CYCLE_STEP
    power_minus = perturb_test(alpha_minus,power)
    
    #test with slightly higher duty cycle
    alpha_plus = alpha + DUTY_CYCLE_STEP
    power_plus = perturb_test(alpha_plus,power)
    
    if (power_minus > power and power_minus > power_plus): #use this if better than the two others
        alpha = alpha_minus
    if (power_plus > power and power_plus > power_minus): #use this if better than the two others
        alpha = alpha_plus
    
    #Exploratory mode to look after a working power point
        #In case the power drops down to 0, we will explore all possible duty cycles to try to catch a working point
    if (power_plus < 50) and (power < 50) and (power_minus < 50):
        alpha = alpha + DUTY_CYCLE_STEP
        if alpha > MAX_DUTY_CYCLE - 2*DUTY_CYCLE_STEP:
            alpha = MIN_DUTY_CYCLE + 2*DUTY_CYCLE_STEP
    
    system_update(alpha)
    
    return 1


## 
def cost_function(target_current,actual_current):
    return abs(target_current - actual_current)

## PPT algorithm to track a target current on the battery input sense resistor
def PPT_step(target_current):
    
    global alpha
    
    #print("PPT_step")
    
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
    if (current_plus < .01) and (current < .01) and (current_minus < .01):
        alpha = alpha + DUTY_CYCLE_STEP
        if alpha > MAX_DUTY_CYCLE - 2*DUTY_CYCLE_STEP:
            alpha = MIN_DUTY_CYCLE + 2*DUTY_CYCLE_STEP
    
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
    #print("error_handle")
    major_problem(3)
    return 1

##Function to corrrect unexpeted errors
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
    

##Main program loop of the logic core
def run():
    
    target_current = 0
    
    data_acquisition()
    
    if (v_c1 >= V_UC and v_c1 < V_OC and v_c2 >= V_UC and v_c2 < V_OC): #Charge at maximum intensity
        ##MPPT step for system update
        #MPPT_step()
        target_current = MAX_I_BAT_IN + i_bat_out
    else:
        if (v_c1 >= V_OC or v_c2 >= V_OC) : ##Do not overcharge a cell
            target_current = i_bat_out
            
        else:
            ##A problem must be signaled
            error_handle()
            
    PPT_step(target_current)

    #real implementation should wait a certain number of time before restarting (no need to always update)
            
    #Other functions to ensure program will keep running in expected conditions
    failsafe()



if __name__ == '__main__':
    
    #initialize system
    init()
    
    #run a given amount of loops for simulation
    if SYS_VAR == "sim":
        for i in range(0,2000):
            run()
    
    #Run infinetely for on board release
    if SYS_VAR == "board":
        while True:
            run()
    
