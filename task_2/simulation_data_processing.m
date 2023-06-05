clc;
close all;
%%

names = ["decent.", "dekupl. dc", "dekupl. $\omega_0$", "$H_{\infty}$", "inverzija"];
load("decentralized_data.mat")
load("scaling_factors.mat")
newcolors = {'#2F7604','#FDB750','#1E73BE','#E80000',  '#010100'};

t = simdata.Time;

widths = [3.4 ,2.6, 1.8, 1, 0.2];

%outputs
xa = simdata.Data(:, 1);
y = simdata.Data(:, 2);
xb = simdata.Data(:, 3);

%inputs
Fa = simdata.Data(:, 4);
Fb = simdata.Data(:, 5);

f = figure(101);
f.Name = 'transient';

idx = t <= 12000;
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-1.2, 1]);
   subplot(3,2, 3);
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 4);
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 5);
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 10]);
   subplot(3,2, 6);
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 2]);

fontsize(f, 8, "points");


f = figure(102);
f.Name = 'step_xa';

idx = t >= txa_r_up*0.99 & t <= txa_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

fontsize(f, 8, "points");


f = figure(103);
f.Name = 'step_y';

idx = t >= ty_r_up*0.99 & t <= ty_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

f = figure(104);
f.Name = 'd_Fa';

idx = t >= tFa_d_up*0.99 & t <= tFa_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);


f = figure(105);
f.Name = 'd_Fb';

idx = t >= tFb_d_up*0.99 & t <= tFb_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);


f = figure(106);
f.Name = 'dir';

idx = t >= tdir*0.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(1));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");







Nstart = 1;
Nend = find(t>= txa_r_up, 1) - 1;
[Ts_y,~] = findTsTr(y, t,Nstart, Nend);
disp("Ts_y: ");
disp(Ts_y);
[~,Tr_xa] = findTsTr(xa, t,Nstart, Nend);
disp("Tr_xa: ");
disp(Tr_xa);
[~,Tr_xb] = findTsTr(xb, t,Nstart, Nend);
disp("Tr_xb: ");
disp(Tr_xb)



Nstart = find(t >= txa_r_up, 1);
Nend = find(t>= txa_r_down, 1);
[~,Tr12] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_12: ");
disp(1/Tr12);
[~,Tr11] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_11: ");
disp(1/Tr11);

Nstart = find(t >= ty_r_up, 1);
Nend = find(t>= ty_r_down, 1);
[~,Tr22] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_22: ");
disp(1/Tr22);
[~,Tr21] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_21: ");
disp(1/Tr21);

disp("w0_wc: ");
disp(min([1/Tr11, 1/Tr12, 1/Tr21, 1/Tr22])*2*pi);


%%

load("decoupling_dc_data.mat")

t = simdata.Time;

%outputs
xa = simdata.Data(:, 1);
y = simdata.Data(:, 2);
xb = simdata.Data(:, 3);

%inputs
Fa = simdata.Data(:, 4);
Fb = simdata.Data(:, 5);

f = figure(101);

f.Name = 'transient';

idx = t <= 12000;
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-1.2, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);

fontsize(f, 8, "points");



f = figure(102);
hold all;
f.Name = 'step_xa';

idx = t >= txa_r_up*0.99 & t <= txa_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.2, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.2, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.5]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.5]);

fontsize(f, 8, "points");


f = figure(103);
f.Name = 'step_y';

idx = t >= ty_r_up*0.99 & t <= ty_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");

f = figure(104);
f.Name = 'd_Fa';

idx = t >= tFa_d_up*0.99 & t <= tFa_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
fontsize(f, 8, "points");


f = figure(105);
f.Name = 'd_Fb';

idx = t >= tFb_d_up*0.99 & t <= tFb_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");


f = figure(106);
f.Name = 'dir';

idx = t >= tdir*0.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(2));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");








Nstart = 1;
Nend = find(t>= txa_r_up, 1) - 1;
[Ts_y,~] = findTsTr(y, t,Nstart, Nend);
disp("Ts_y: ");
disp(Ts_y);
[~,Tr_xa] = findTsTr(xa, t,Nstart, Nend);
disp("Tr_xa: ");
disp(Tr_xa);
[~,Tr_xb] = findTsTr(xb, t,Nstart, Nend);
disp("Tr_xb: ");
disp(Tr_xb)



Nstart = find(t >= txa_r_up, 1);
Nend = find(t>= txa_r_down, 1);
[~,Tr12] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_12: ");
disp(1/Tr12);
[~,Tr11] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_11: ");
disp(1/Tr11);

Nstart = find(t >= ty_r_up, 1);
Nend = find(t>= ty_r_down, 1);
[~,Tr22] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_22: ");
disp(1/Tr22);
[~,Tr21] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_21: ");
disp(1/Tr21);

disp("w0_wc: ");
disp(min([1/Tr11, 1/Tr12, 1/Tr21, 1/Tr22])*2*pi);

%%
load("decoupling_w0_data.mat")

t = simdata.Time;

%outputs
xa = simdata.Data(:, 1);
y = simdata.Data(:, 2);
xb = simdata.Data(:, 3);

%inputs
Fa = simdata.Data(:, 4);
Fb = simdata.Data(:, 5);

f = figure(101);

f.Name = 'transient';

idx = t <= 12000;
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-1.2, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);

fontsize(f, 8, "points");



f = figure(102);
hold all;
f.Name = 'step_xa';

idx = t >= txa_r_up*0.99 & t <= txa_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.2, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.2, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.5]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.5]);

fontsize(f, 8, "points");

f = figure(103);
f.Name = 'step_y';

idx = t >= ty_r_up*0.99 & t <= ty_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");

f = figure(104);
f.Name = 'd_Fa';

idx = t >= tFa_d_up*0.99 & t <= tFa_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
fontsize(f, 8, "points");


f = figure(105);
f.Name = 'd_Fb';

idx = t >= tFb_d_up*0.99 & t <= tFb_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");

f = figure(106);
f.Name = 'dir';

idx = t >= tdir*0.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(3));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");





Nstart = 1;
Nend = find(t>= txa_r_up, 1) - 1;
[Ts_y,~] = findTsTr(y, t,Nstart, Nend);
disp("Ts_y: ");
disp(Ts_y);
[~,Tr_xa] = findTsTr(xa, t,Nstart, Nend);
disp("Tr_xa: ");
disp(Tr_xa);
[~,Tr_xb] = findTsTr(xb, t,Nstart, Nend);
disp("Tr_xb: ");
disp(Tr_xb)



Nstart = find(t >= txa_r_up, 1);
Nend = find(t>= txa_r_down, 1);
[~,Tr12] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_12: ");
disp(1/Tr12);
[~,Tr11] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_11: ");
disp(1/Tr11);

Nstart = find(t >= ty_r_up, 1);
Nend = find(t>= ty_r_down, 1);
[~,Tr22] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_22: ");
disp(1/Tr22);
[~,Tr21] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_21: ");
disp(1/Tr21);

disp("w0_wc: ");
disp(min([1/Tr11, 1/Tr12, 1/Tr21, 1/Tr22])*2*pi);


%%

load("inv_f_data.mat")
t = simdata.Time;

%outputs
xa = simdata.Data(:, 1);
y = simdata.Data(:, 2);
xb = simdata.Data(:, 3);

%inputs
Fa = simdata.Data(:, 4);
Fb = simdata.Data(:, 5);

f = figure(101);

f.Name = 'transient';

idx = t <= 12000;
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-1.2, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);

fontsize(f, 8, "points");



f = figure(102);
hold all;
f.Name = 'step_xa';

idx = t >= txa_r_up*0.99 & t <= txa_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.2, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.2, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.5]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.5]);

fontsize(f, 8, "points");

f = figure(103);
f.Name = 'step_y';

idx = t >= ty_r_up*0.99 & t <= ty_r_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");

f = figure(104);
f.Name = 'd_Fa';

idx = t >= tFa_d_up*0.99 & t <= tFa_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
fontsize(f, 8, "points");


f = figure(105);
f.Name = 'd_Fb';

idx = t >= tFb_d_up*0.99 & t <= tFb_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");

  f = figure(106);
f.Name = 'dir';

idx = t >= tdir*0.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(4));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-1, 1]);

        fontsize(f, 8, "points");





Nstart = 1;
Nend = find(t>= txa_r_up, 1) - 1;
[Ts_y,~] = findTsTr(y, t,Nstart, Nend);
disp("Ts_y: ");
disp(Ts_y);
[~,Tr_xa] = findTsTr(xa, t,Nstart, Nend);
disp("Tr_xa: ");
disp(Tr_xa);
[~,Tr_xb] = findTsTr(xb, t,Nstart, Nend);
disp("Tr_xb: ");
disp(Tr_xb)



Nstart = find(t >= txa_r_up, 1);
Nend = find(t>= txa_r_down, 1);
[~,Tr12] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_12: ");
disp(1/Tr12);
[~,Tr11] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_11: ");
disp(1/Tr11);

Nstart = find(t >= ty_r_up, 1);
Nend = find(t>= ty_r_down, 1);
[~,Tr22] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_22: ");
disp(1/Tr22);
[~,Tr21] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_21: ");
disp(1/Tr21);

disp("w0_wc: ");
disp(min([1/Tr11, 1/Tr12, 1/Tr21, 1/Tr22])*2*pi);


%%


load("h_inf_data.mat")
t = simdata.Time;

%outputs
xa = simdata.Data(:, 1);
y = simdata.Data(:, 2);
xb = simdata.Data(:, 3);

%inputs
Fa = simdata.Data(:, 4);
Fb = simdata.Data(:, 5);

f = figure(101);

f.Name = 'transient';

idx = t <= 12000;
figure(f);
    subplot(3,2, 1:2);
    hold all;
    a = plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-1.2, 1]);
   subplot(3,2, 3);
   hold all;
   b = plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 4);
   hold all;
   c = plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([-8, 1.2]);
   subplot(3,2, 5);
   hold all;
    d = plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);
   subplot(3,2, 6);
   hold all;
   plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, 3]);

fontsize(f, 8, "points");

subplot(3,2, 1:2);
legend(names, 'Location', 'eastoutside');
set(gcf, 'Renderer', 'Painters');
colororder(newcolors)

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 


f = figure(102);
hold all;
f.Name = 'step_xa';

idx = t >= txa_r_up*0.99 & t <= 2.6e4;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.22, 0.14]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 0.8]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.08, 0.8]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 2.51]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 1.56]);

fontsize(f, 8, "points");

subplot(3,2, 1:2);
legend(names, 'Location', 'eastoutside');
set(gcf, 'Renderer', 'Painters');
colororder(newcolors)


if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 

f = figure(103);
f.Name = 'step_y';

idx = t >= ty_r_up*0.99 & t <= 4.9e4;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 0.4]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.12, 0.02]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.02, 0.8]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 0.6]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 0.6]);

        fontsize(f, 8, "points");


subplot(3,2, 1:2);
legend(names, 'Location', 'eastoutside');
set(gcf, 'Renderer', 'Painters');
colororder(newcolors)


if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 

f = figure(104);
f.Name = 'd_Fa';

idx = t >= tFa_d_up*0.99 & t <= tFa_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.06, 0.006]);
   subplot(3,2, 3);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 0.055]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.055, 0.04]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.008, 0.11]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.03, 0.03]);
fontsize(f, 8, "points");

subplot(3,2, 1:2);
legend(names, 'Location', 'eastoutside');
set(gcf, 'Renderer', 'Painters');
colororder(newcolors)


if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 


f = figure(105);
f.Name = 'd_Fb';

idx = t >= tFb_d_up*0.99 & t <= tFb_d_down*.99;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([0, 0.09]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.06, 0.008]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.008, 0.14]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.01, 0.05]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([-0.01, 0.11]);

        fontsize(f, 8, "points");

subplot(3,2, 1:2);
legend(names, 'Location', 'eastoutside');
set(gcf, 'Renderer', 'Painters');
colororder(newcolors)


if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 



f = figure(106);
f.Name = 'dir';

idx = t >= tdir*0.995;
tmp = t(idx);
figure(f);
    subplot(3,2, 1:2);
    hold all;
    plot(t(idx), Dy(2, 2)^-1*(y(idx) - y0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) 1.3e5]);
        ylim([0, .92]);
   subplot(3,2, 3);hold all;
    plot(t(idx), Dy(1, 1)^-1*(xa(idx)-xa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) 1.3e5]);
        ylim([-0.04, 0.42]);
   subplot(3,2, 4);
   hold all;
    plot(t(idx), Dy(1, 1)^-1*(xb(idx)-xb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) 1.3e5]);
        ylim([0, 2.32]);
   subplot(3,2, 5);
   hold all;
    plot(t(idx), Du(1, 1)^-1*(Fa(idx) - Fa0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) 1.3e5]);
        ylim([0, 3]);
   subplot(3,2, 6);
   hold all;
    plot(t(idx), Du(2, 2)^-1*(Fb(idx) - Fb0), 'LineWidth', widths(5));
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [a.u.]');
        tmp = t(idx);
        xlim([tmp(1) 1.3e5]);
        ylim([0, 2.4]);

        fontsize(f, 8, "points");
subplot(3,2, 1:2);
legend(names, 'Location', 'eastoutside');
set(gcf, 'Renderer', 'Painters');

colororder(newcolors)


if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 



Nstart = 1;
Nend = find(t>= txa_r_up, 1) - 1;
[Ts_y,~] = findTsTr(y, t,Nstart, Nend);
disp("Ts_y: ");
disp(Ts_y);
[~,Tr_xa] = findTsTr(xa, t,Nstart, Nend);
disp("Tr_xa: ");
disp(Tr_xa);
[~,Tr_xb] = findTsTr(xb, t,Nstart, Nend);
disp("Tr_xb: ");
disp(Tr_xb)



Nstart = find(t >= txa_r_up, 1);
Nend = find(t>= txa_r_down, 1);
[~,Tr12] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_12: ");
disp(1/Tr12);
[~,Tr11] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_11: ");
disp(1/Tr11);

Nstart = find(t >= ty_r_up, 1);
Nend = find(t>= ty_r_down, 1);
[~,Tr22] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_22: ");
disp(1/Tr22);
[~,Tr21] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_21: ");
disp(1/Tr21);

disp("w0_wc: ");
disp(min([1/Tr11, 1/Tr12, 1/Tr21, 1/Tr22])*2*pi);


