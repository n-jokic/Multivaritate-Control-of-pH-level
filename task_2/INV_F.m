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
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


f = figure(2);
f.Name = 'margin_G22_norm_inv';
margin(G_22_star_norm );
set(gcf, 'Renderer', 'Painters');
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
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


f = figure(4);
f.Name = 'margin_KG22_norm_inv';
margin(G_22_star_norm*K22_star_norm);
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%%

K_star_norm = [K11_star_norm 0; 0 K22_star_norm];
K_norm = W1_inv*K_star_norm;

K_inv = Du*K_norm*Dy^-1;
save('inv_f', 'K_inv');

%%
f = figure(8);
f.Name = 'Sigma_G_W_inv';
w = logspace(-6, 0, 5000);
svG = sigma(tf(G_tf_norm), w);
W = G_tf_norm*K_norm;
svW = sigma(W, w);
semilogx(w,20*log10(svW(1,:)), 'r', w,20*log10(svG(1,:)), 'b'); hold on;
semilogx(w,20*log10(svW(2,:)), 'r', w,20*log10(svG(2,:)), 'b'); hold off;
xlabel('$\omega $ [rad/s]'); ylabel('$\sigma [dB]$');
grid on;
legend('$\sigma(W) $', '$\sigma(G) $');
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

T = W*(eye(2) + W)^-1;
svT = sigma(T, w);
S = eye(2) - T;
svS = sigma(S, w);

f = figure(9);
f.Name = 'sigma_KG_tf_norm_inv';
semilogx(w, 20*log10(svT(1,:)), 'b', w, 20*log10(svS(1,:)), 'r'); hold on;
semilogx(w, 20*log10(svT(2,:)), 'b', w, 20*log10(svS(2,:)), 'r'); hold off;
xlabel('$\omega $ [rad/s]'); ylabel('$\sigma [dB]$');
grid on;
legend('$\sigma(T) $', '$\sigma(S) $', 'Location', 'best');
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


%%
S = minreal((eye(2) + K_norm*G_tf_norm)^-1);
T = eye(2) - S;
f = figure(25);
f.Name = 'step_T_inv';
step(T, 10000, 'k');
xlabel('t');
ylabel('y(t)');
hold off; grid on;
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

f = figure(26);
f.Name = 'step_KS_inv';
step(K_norm*S*0.1, 10000, 'k');
xlabel('t');
ylabel('u(t)');
hold off; grid on;
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end
