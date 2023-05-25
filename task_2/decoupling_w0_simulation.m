close all;
clc;
%%
load('parameters.mat')
load('scaling_factors.mat')
load("decoupling_w0.mat")
load('set_point.mat')

K_sel = 3;

Kss = ss(K_decoupling_w0);
A3 = Kss.A;
B3 = Kss.B;
C3 = Kss.C;
D3 = Kss.D;

sim('.\model\CSTR_sim.slx')

save('decoupling_w0_data', "simdata");
