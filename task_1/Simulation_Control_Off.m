load('parameters')
load('set_point.mat')
Ts = 10;
t_end = 155000;
tFa_up = 35000;
tFa_down= 65000;

tFb_up = 95000;
tFb_down= 125000;

%% Open loop step response:


sim('.\model\CSTR_sim.slx');

t = simdata.Time;

%outputs
xa = simdata.Data(:, 1);
y = simdata.Data(:, 2);
xb = simdata.Data(:, 3);

%inputs
Fa = simdata.Data(:, 4);
Fb = simdata.Data(:, 5);

f = figure(101);
f.Name = 'Transient';

idx = t <= 22000;
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), y(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [pH]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([7, 7.2]);
   subplot(3,2, 3);
    plot(t(idx), xa(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [mol/l]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, max(xb)*1.1]);
   subplot(3,2, 4);
    plot(t(idx), xb(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [mol/l]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, max(xb)*1.1]);
   subplot(3,2, 5);
    plot(t(idx), Fa(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [l/s]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, max(Fb)*1.1]);
   subplot(3,2, 6);
    plot(t(idx), Fb(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [l/s]');
        tmp = t(idx);
        xlim([t(1) tmp(end)]);
        ylim([0, max(Fb)*1.1]);

fontsize(f, 8, "points");
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 


f = figure(102);
f.Name = 'Step_response_ol';

idx = t >= 30000;
figure(f);
    subplot(3,2, 1:2);
    plot(t(idx), y(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$y(t)$ [pH]');
        tmp = t(idx);
        xlim([tmp(1) tmp(end)]);
        ylim([6.9, 7.1]);
   subplot(3,2, 3);
    plot(t(idx), xa(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_a(t)$ [mol/l]');
        xlim([tmp(1) tmp(end)]);
        ylim([2.9e-7, 3.4e-7]);
   subplot(3,2, 4);
    plot(t(idx), xb(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$x_b(t)$ [mol/l]');
        xlim([tmp(1) tmp(end)]);
        ylim([2.9e-7, 3.4e-7]);
   subplot(3,2, 5);
    plot(t(idx), Fa(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_a(t)$ [l/s]');
        xlim([tmp(1) tmp(end)]);
        ylim([min(Fa)*0.9, max(Fa)*1.1]);
   subplot(3,2, 6);
    plot(t(idx), Fb(idx), 'black');
        grid on;
        xlabel('$t$ [s]');
        ylabel('$F_b(t)$ [l/s]');
        xlim([tmp(1) tmp(end)]);
        ylim([min(Fb)*0.9, max(Fb)*1.1]);

fontsize(f, 8, "points");
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%%

Nstart = 1;
Nend = find(t>= tFa_up, 1) - 1;
[Ts_y,~] = findTsTr(y, t,Nstart, Nend);
disp("Ts_y: ");
disp(Ts_y);
[~,Tr_xa] = findTsTr(xa, t,Nstart, Nend);
disp("Tr_xa: ");
disp(Tr_xa);
[~,Tr_xb] = findTsTr(xb, t,Nstart, Nend);
disp("Tr_xb: ");
disp(Tr_xb)



Nstart = find(t >= tFa_up, 1);
Nend = find(t>= tFa_down, 1);
[~,Tr12] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_12: ");
disp(1/Tr12);
[~,Tr11] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_11: ");
disp(1/Tr11);

Nstart = find(t >= tFb_up, 1);
Nend = find(t>= tFb_down, 1);
[~,Tr22] = findTsTr(y, t,Nstart, Nend);
disp("1/Tr_22: ");
disp(1/Tr22);
[~,Tr21] = findTsTr(xa, t,Nstart, Nend);
disp("1/Tr_21: ");
disp(1/Tr21);

disp("w0_wc: ");
disp(min([1/Tr11, 1/Tr12, 1/Tr21, 1/Tr22])*2*pi);



