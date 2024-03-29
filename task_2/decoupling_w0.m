clc; 
%close all;
%%


load('linear_model.mat')
load('scaling_factors.mat')
load('controler_params')

G_tf_norm = Dy^-1*tf(minreal(Gss))*Du;

G_w0 = freqresp(G_tf_norm, w1);

W = real_inverse(G_w0);

G_star_norm = G_tf_norm*W;

G_11_star_norm = G_star_norm(1, 1);
G_22_star_norm = G_star_norm(2, 2);

f = figure(1);
f.Name = 'margin_G11_norm_decoupling_w0';
margin(G_11_star_norm );
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


f = figure(2);
f.Name = 'margin_G22_norm_decoupling_w0';
margin(G_22_star_norm );
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%% PI kontroler
s = tf('s');
[m1, p1] = bode(G_11_star_norm, w1);

[m2, p2] = bode(G_22_star_norm, w1);

Ti1 = tan(Pf - pi/2 - p1*pi/180)/w1;
Kc1 = 1/(abs((Ti1*1j*w1 + 1)*m1/Ti1/1j/w1));

Ti2 = tan(Pf - pi/2 - p2*pi/180)/w1;
Kc2 = 1/(abs((Ti2*1j*w1 + 1)*m2/Ti2/1j/w1));

K11_star_norm = Kc1*(1+1/Ti1/s);

K22_star_norm = Kc2*(1+1/Ti2/s);

f = figure(3);
f.Name = 'margin_KG11_norm_decoupling_w0';
margin(G_11_star_norm*K11_star_norm);
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end


f = figure(4);
f.Name = 'margin_KG22_norm_decoupling_w0';
margin(G_22_star_norm*K22_star_norm);
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%%

K_star_norm = [K11_star_norm 0; 0 K22_star_norm];
K_norm = W*K_star_norm;

K_decoupling_w0 = Du*K_norm*Dy^-1;
save('decoupling_w0', 'K_decoupling_w0');

%%
f = figure(8);
f.Name = 'Sigma_G_W_decoupling_w0';
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
f.Name = 'sigma_KG_tf_norm_decoupling_w0';
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
f.Name = 'step_T_decoupling_w0';
h = stepplot(T, 10000, 'k');
p = getoptions(h);
p.TimeUnits = 'hours';

setoptions(h, p);
xlabel('t');
ylabel('y(t)'); grid on;
hold off;
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

f = figure(21);
f.Name = 'step_KS_decoupling_w0';
h = stepplot(K_norm*S*0.1, 10000, 'k');
p = getoptions(h);
p.TimeUnits = 'hours';

setoptions(h, p);
xlabel('t');
ylabel('u(t)');
hold off; grid on;
set(gcf, 'Renderer', 'Painters');
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end
