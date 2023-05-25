close all;
clc;
%%
load('parameters.mat')
load('scaling_factors.mat')
load("decent_controler.mat")
load('set_point.mat')

K_sel = 1;

Kss = ss(K_decenent);
A1 = Kss.A;
B1 = Kss.B;
C1 = Kss.C;
D1 = Kss.D;

save('decentralized_data', "simdata");
