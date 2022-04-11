table = readtable("MPPT_test.csv");

figure(1),clf,hold on
subplot(2,2,1), hold on
plot(table.sim_step,table.theo_max_i_bat_in,'k--','LineWidth',3)
plot(table.sim_step,table.i_bat_in,'r','LineWidth',2)
legend("Theoretical maximum","Obtained")
title("current at battery input")
ylabel("I_B_A_T in (A)")

subplot(2,2,2), hold on
plot(table.sim_step,table.theo_max_power_pv,'k--','LineWidth',3)
plot(table.sim_step,table.power_pv,'r','LineWidth',2)
legend("Theoretical maximum","Obtained")
title("power output at solar panel")
ylabel("P_P_V (W)")

subplot(2,1,2), hold on
plot(table.sim_step,table.theo_max_alpha,'k--','LineWidth',3)
plot(table.sim_step,table.alpha,'r','LineWidth',2)
legend("Theoretical maximum","Obtained")
title("alpha SMPS")
ylabel("DUTY CYCLE (%)")

