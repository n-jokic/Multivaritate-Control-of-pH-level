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

