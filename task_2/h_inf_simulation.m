close all;
clc;
%%
load('parameters.mat')
load('scaling_factors.mat')
load("H_inf.mat")
load('set_point.mat')

K_sel = 4;

Kss = ss(K_inf);
A4 = Kss.A;
B4 = Kss.B;
C4 = Kss.C;
D4 = Kss.D;

sim('.\model\CSTR_sim.slx')

save('h_inf_data', "simdata");
