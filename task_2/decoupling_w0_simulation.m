close all;
clc;
%%
load('parameters.mat')
load('scaling_factors.mat')
load("decoupling_w0.mat")
load('set_point.mat')

K_sel = 2;

Kss = ss(K_decoupling_w0);
A2 = Kss.A;
B2 = Kss.B;
C2 = Kss.C;
D2 = Kss.D;

sim('.\model\CSTR_sim.slx')

save('decoupling_w0_data', "simdata");
