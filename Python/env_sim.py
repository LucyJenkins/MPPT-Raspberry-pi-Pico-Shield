#File: Logic_core.py
#Author: Lucy Jenkins
#Description:
#   Functions and values for simulation purposes only on the MPPT project
#   This files aims at reproducing the system's onboard behaviour to allow for logic core adjustements without need for the experimental set up
#
#   This file features functions which allow:
#       - Functions to provide in/outs as if the logic core had to interact with its on board environment
#       - Constant solar panel behaviour to test basic MPPT and PPT functions and stability
#       - Sinusoidal solar panel behaviour to test tracking behaviour of the algorithm
#       - Provides theoretical maximums to simulation files (brute force solving) to: best alpha, best power, best current at battery input
#
#To do:
#   - Add simulation support for an imperfect solar panel characteristic (with local minimums and maximums)

from math import exp
from math import sin

##CSV handle (simulation output)
import csv

fields = ['sim_step','alpha','V_OPEN_PV','v_pv','v_c1','v_c2','I_SHUNT_PV','i_pv','i_bat_in','i_bat_out','power_pv','theo_max_alpha','theo_max_i_bat_in','theo_max_power_pv']
filename = "MPPT_test.csv"

with open(filename,'w') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerow(fields)

##Simulation constants
TRACKING_TEST = True   #(False: constant characteristics ; True: sinusoidal characteristic for tracking test)
TRACKING_PERIOD = 500  #Number of steps to do a full rotation on the tracking

IMPERFECT_TEST = False #Try to use an imperfect solar panel characteristic

V_OPEN_PV = 14.5       #Open voltage of the solar panel
I_SHUNT_PV = .1        #Short current of the solar panel

SMPS_EFFICIENCY = .7 #70% efficiency on SMPS

I_BATT_OUT = .05 #50 mAmps on battery output

##Simulation variables
v_pv_sim = 0
v_c1_sim = 3.7
v_c2_sim = 3.7

i_pv_sim = 0
i_bat_in_sim = 0
i_bat_out_sim = 0

alpha_sim = 0

sim_step = 0

##Data acquisition functions
def acq_v_pv():
    return v_pv_sim

def acq_v_c1():
    return v_c1_sim

def acq_v_c2():
    return v_c2_sim

def acq_i_pv():
    return i_pv_sim

def acq_i_bat_in():
    return i_bat_in_sim

def acq_i_bat_out():
    return i_bat_out_sim



##Update function to make logic core and model interact
#real function should wait for system to react (let's say .5 seconds) to let it update
#
#To do:
#   - Find better factorized way to calculate power points (2 instances of the same calculation here)
def system_update(alpha):
    global sim_step,alpha_sim,v_pv_sim,v_c1_sim,v_c2_sim,i_pv_sim,i_bat_in_sim,i_bat_out_sim
    
    ##Simulate for this alpha
    alpha_sim = alpha
    
    if TRACKING_TEST: #sinusoidal power model
        factor = .75 + sin(2*3.1415*sim_step/TRACKING_PERIOD)/4
    else: #simple solar panel model (constant)
        factor = 1
    
    v_pv_sim = (1-alpha_sim)*(v_c1_sim+v_c2_sim+.5)/alpha_sim #simulates a buck boost SMPS
        
    i_pv_sim = (I_SHUNT_PV*factor)*(1 - exp(v_pv_sim - (V_OPEN_PV*factor)))
    
    if i_pv_sim < 0:
        i_pv_sim = 0
    
    i_bat_in_sim = SMPS_EFFICIENCY*(v_pv_sim/(v_c1_sim+v_c2_sim+.5))*i_pv_sim
    i_bat_out_sim = I_BATT_OUT
    
    
    ##Brute force solve for the maximum theoretical power point ['theo_max_alpha','theo_max_i_bat_in','theo_max_power_pv']
    a_min = .25
    a_max = .75
    a_step = .002
    
    i_min = int(a_min/a_step)
    i_max = int(a_max/a_step)+1
    
    best_alpha = a_min
    best_i_bat_in = 0
    best_power = 0
    
    alpha_test = a_min
    power = 0
    
    for i in range(i_min,i_max):
        alpha_test = i*a_step
        
        v_pv = (1-alpha_test)*(v_c1_sim+v_c2_sim+.5)/alpha_test #simulates a system using a buck boost SMPS
        i_pv = (I_SHUNT_PV*factor)*(1 - exp(v_pv - (V_OPEN_PV*factor)))
        if i_pv < 0:
            i_pv = 0
        
        i_bat_in = SMPS_EFFICIENCY*(v_pv/(v_c1_sim+v_c2_sim+.5))*i_pv
        power = i_pv*v_pv
        
        if power > best_power:
            best_alpha = alpha_test
            best_i_bat_in = i_bat_in
            best_power = power
         
    
    ##Write new simulation step to csv file & maximum theoretical point
    sim_step = sim_step + 1
    new_row = [sim_step,alpha,V_OPEN_PV,v_pv_sim,v_c1_sim,v_c2_sim,I_SHUNT_PV,i_pv_sim,i_bat_in_sim,i_bat_out_sim,v_pv_sim*i_pv_sim,best_alpha,best_i_bat_in,best_power]
    with open(filename,'a') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(new_row)
    
    #write status to console
    #string = ""
    #for i in range(0,len(fields)):
    #    string = string+fields[i]+": "+str(new_row[i])+" ;"
    #print(string)
    
    return 1

##User interface functions for simulation purposes
#Minor problem issues a visual signal to the user
def minor_problem(cause):
    if cause == 1:
        print("UV LED on\n")
    if cause == 2:
        print("OV LED on\n")
    if cause == 3:
        print("Signal LED on\n")
    return 1

#Major problem issues a visual and auditory signal to the user
def major_problem(cause):
    minor_problem(cause)
    print("Buzzer on\n")
    return 1

#Problem has been solved or suppressed => turn off signal
def end_problem(cause):
    if cause == 1:
        print("UV LED off\n")
    if cause == 2:
        print("OV LED off\n")
    if cause == 3:
        print("Signal LED off\n")
    
    print("Buzzer off\n")
    
    
