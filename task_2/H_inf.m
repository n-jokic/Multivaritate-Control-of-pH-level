clc;
close all;
%%


load('linear_model.mat')
load('scaling_factors.mat')
load('controler_params')

G_tf_norm = Dy^-1*tf(minreal(Gss))*Du;

%%

M = 1.32;
w0 = w1;
S0 = 1e-3;
s = tf('s');
gs = (s + w0*S0)/(s/M + w0);

Ws = gs^-1*eye(2);

Ku = 1;
Wu = 1/Ku*eye(2);
%% Kreiranje generelisanog O.U. P:
G = G_tf_norm;

systemnames = 'G Ws Wu';
inputvar    = '[r(2); u(2)]';
outputvar   = '[Ws; Wu; r-G]';
input_to_G  = '[u]';
input_to_Ws = '[r-G]';
input_to_Wks = '[u]';
P = minreal(sysic);
%% Ninf
ny = 2;
nu = 2;
[Kinf, Ninf, goptvl] = hinfsyn(P, ny, nu, 'DISPLAY', 'on');
%%

K = minreal(ss(Kinf));
w = logspace(-6, 0, 1000);
S = minreal((eye(2) + K*G)^-1);
T = minreal(eye(2) - S);

f = figure(1);
f.Name ='WS/WKS';
    subplot(2, 1, 1);
    

    semilogx(w, abs(sigma(Ws*S, w)));
        xlabel('$\omega$ [rad/s]');
        ylabel('$\|W_sS\|$');
        title('Ponderisana osetljivost');

  subplot(2, 1, 2);

    semilogx(w, abs(sigma(Wu*K*S, w)));
        xlabel('$\omega$ [rad/s]');
        ylabel('$\|W_uKS\|$');
        title('Ponderisano upravljanje');

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end
    
f = figure(2);
f.Name = 'sigma_KG_inf';
    svT = sigma(T, w);
    svS = sigma(S, w);
    sWs = sigma(Ws, w);
    semilogx(w, 20*log10(abs(svT)), 'r', w, 20*log10(abs(svS)), 'b');
    hold on;
    semilogx(w, 20*log10(sWs.^-1), 'b:');

        xlabel('$\omega$ [rad/s]');
        ylabel('$T, S$');
        title('Singularne vrednosti');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%%
K_inf_norm = tf(minreal(K));
K_norm = K_inf_norm;
K_inf = Du*K_inf_norm*Dy^-1;
save('H_inf', 'K_inf');
%%
S = minreal((eye(2) + K_norm*G_tf_norm)^-1);
T = eye(2) - S;
f = figure(25);
f.Name = 'step_T_inf';
step(T, 10000, 'k');
xlabel('$t$[s]');
ylabel('$y(t)$ [a.u.]');
hold off;
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

f = figure(26);
f.Name = 'step_KS_inf';
step(K_norm*S*0.1, 10000, 'k');
xlabel('$t$[s]');
ylabel('$u(t)$ [a.u.]');
hold off;
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

