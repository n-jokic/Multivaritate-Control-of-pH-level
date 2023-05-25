close all;
clc;
%%
load('parameters.mat')
load('scaling_factors.mat')
load("decoupling_dc.mat")
load('set_point.mat')

K_sel = 2;

Kss = ss(K_decoupling_dc);
A2 = Kss.A;
B2 = Kss.B;
C2 = Kss.C;
D2 = Kss.D;

sim('.\model\CSTR_sim.slx')

save('decoupling_w0_data', "simdata");
