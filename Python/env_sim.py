##Repository of functions and values for simulation purposes only
from math import exp
from math import sin

import csv

fields = ['sim_step','alpha','V_OPEN_PV','v_pv','v_c1','v_c2','I_SHUNT_PV','i_pv','i_bat_in','i_bat_out','power_pv']
filename = "MPPT_test.csv"

with open(filename,'w') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerow(fields)

##System values
v_pv_sim = 0
v_c1_sim = 3.7
v_c2_sim = 3.7

i_pv_sim = 0
i_bat_in_sim = 0
i_bat_out_sim = 0

alpha_sim = 0

sim_step = 0

TRACKING_TEST = True #(False: constant characteristics ; True: sinusoidal characteristic for tracking test)
TRACKING_PERIOD = 5000 #Number of steps to do a full rotation on the tracking
V_OPEN_PV = 12  #Open voltage of the solar panel
I_SHUNT_PV = .5 #Short current of the solar panel

SMPS_EFFICIENCY = .85 #85% efficiency on SMPS

I_BATT_OUT = .25

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
def system_update(alpha):
    global sim_step,alpha_sim,v_pv_sim,v_c1_sim,v_c2_sim,i_pv_sim,i_bat_in_sim,i_bat_out_sim
    
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
    
    #write new simulation step to csv file
    sim_step = sim_step + 1
    new_row = [sim_step,alpha,V_OPEN_PV,v_pv_sim,v_c1_sim,v_c2_sim,I_SHUNT_PV,i_pv_sim,i_bat_in_sim,i_bat_out_sim,v_pv_sim*i_pv_sim]
    with open(filename,'a') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(new_row)
    
    #write to console status
    string = ""
    for i in range(0,len(fields)):
        string = string+fields[i]+": "+str(new_row[i])+" ;"
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
    
    
