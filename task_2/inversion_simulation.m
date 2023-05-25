close all;
clc;
%%
load('parameters.mat')
load('scaling_factors.mat')
load("inv_f.mat")
load('set_point.mat')

K_sel = 5;

Kss = ss(K_inv);
A5 = Kss.A;
B5 = Kss.B;
C5 = Kss.C;
D5 = Kss.D;

sim('.\model\CSTR_sim.slx')

save('inv_f_data', "simdata");
