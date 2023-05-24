clc;
close all;
%%


load('linear_model.mat')
load('scaling_factors.mat')
load('controler_params')

G_tf_norm = Dy^-1*tf(minreal(Gss))*Du;

W1_inv = G_tf_norm^-1*(1/(s/(10*w1) + 1));

G_star_norm = G_tf_norm*W1_inv;

G_11_star_norm = G_star_norm(1, 1);
G_22_star_norm = G_star_norm(2, 2);

f = figure(1);
f.Name = 'margin_G11_norm_inv';
margin(G_11_star_norm );

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


f = figure(2);
f.Name = 'margin_G22_norm_inv';
margin(G_22_star_norm );

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%% PI kontroler
s = tf('s');


K11_star_norm = w1/s;

K22_star_norm = w1/s;


f = figure(3);
f.Name = 'margin_KG11_norm_inv';
margin(G_11_star_norm*K11_star_norm);

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


f = figure(4);
f.Name = 'margin_KG22_norm_inv';
margin(G_22_star_norm*K22_star_norm);

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%%

K_star_norm = [K11_star_norm 0; 0 K22_star_norm];
K_norm = W1_inv*K_star_norm;

K_inv = Du*K_norm*Dy^-1;
save('inv_f', 'K_inv');

%%
figure(8);
w = logspace(-6, 0, 5000);
svG = sigma(tf(Gss), w);
W = G_tf_norm*K_norm;
svW = sigma(W, w);
plot(log10(w), 20*log10(svW), 'r');
%legend('originalni', 'sa kontrolerom');

T = W*(eye(2) + W)^-1;
svT = sigma(T, w);
S = eye(2) - T;
svS = sigma(S, w);

figure(9);
f.Name = 'sigma_KG_tf_norm_inv';
semilogx(w, 20*log10(svT), 'b');
hold on;
semilogx(w, 20*log10(svS), 'r');
hold off;
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end
%%
S = minreal((eye(2) + K_norm*G_tf_norm)^-1);
T = eye(2) - S;
f = figure(25);
f.Name = 'step_T_inv';
step(T, 10000, 'k');
xlabel('$t$[s]');
ylabel('$y(t)$ [a.u.]');
hold off;
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

f = figure(26);
f.Name = 'step_KS_inv';
step(K_norm*S*0.1, 10000, 'k');
xlabel('$t$[s]');
ylabel('$u(t)$ [a.u.]');
hold off;
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end
