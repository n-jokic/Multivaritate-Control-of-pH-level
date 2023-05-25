%%
clear all;
close all;


% This script changes all interpreters from tex to latex. 

list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));

for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end


%%

SAVE = 0; 
path = 'C:\Users\milos\OneDrive\VIII semestar\MSU\projekat\izvestaj\slike\zad1';

kv = 0.01; % 1/s
kw = 1e-14; % (mol/l)^2
Ca = 1e-6; % mol/l
Cb = 1e-6; % mol/l
V = 30; % l
y = 7; %pH
xa0 = 3.1250e-07; % mol/l
Ts = 1; %s


save('parameters', 'kv', 'kw', 'Ca', 'Cb', 'V', 'y', 'xa0');

Pf = 60*pi/180;
w1 = 0.002;

save('controler_params', 'Pf', 'w1');

%%
linearisation;

%%
dencentralizovano;
%%
decoupling_dc;
%%
decoupling_w0;
%%
H_inf;
%%
INV_F;
%%
A1 = 0*eye(2); B1 =  eye(2); C1 =  eye(2); D1 =  eye(2);
A2 = 0*eye(2);B2 =  eye(2);C2 =  eye(2); D2 =  eye(2);
A3 =0*eye(2); B3 =  eye(2); C3 =  eye(2); D3 =  eye(2);
A4 = 0*eye(2); B4 =  eye(2); C4 =  eye(2); D4 = eye(2);
A5 = 0*eye(2); B5 =  eye(2); C5 =  eye(2); D5 =  eye(2);
K_sel = 1; t_end = 105000; txa_r_up = 20000; txa_r_down = 30000;
ty_r_up = 45000; ty_r_down = 55000; d1 = 1; d2 = 1; tFa_d_up = 65000;
tFa_d_down = 75000; tFb_d_up = 85000; tFb_d_down = 95000;

%%
decentralized_simulation;
%%
decoupling_dc_simulation;
%%
decoupling_w0_simulation;
%%
h_inf_simulation;
