load('scaling_factors.mat')
load('linear_model.mat')
load('decent_controler.mat')
load('decoupling_w0.mat')
load('decoupling_dc.mat')
load('inv_f.mat')
load('H_inf.mat')


w = logspace(-5, 0, 5000);

G_tf_norm = Dy^-1*tf(minreal(Gss))*Du;


[svS1, svT1] = sigma_S_T(K_decenent, Du, Dy, G_tf_norm, w);
[svS2, svT2] = sigma_S_T(K_decoupling_dc, Du, Dy, G_tf_norm, w);
[svS3, svT3] = sigma_S_T(K_decoupling_w0, Du, Dy, G_tf_norm, w);
[svS4, svT4] = sigma_S_T(K_inf, Du, Dy, G_tf_norm, w);
[svS5, svT5] = sigma_S_T(K_inv, Du, Dy, G_tf_norm, w);

f = figure(100);
f.Name = 'Sigma_T_komp';
semilogx(w, 20*log10(svT1(1,:)), 'r', w, 20*log10(svT2(1,:)), 'k', ...
     w, 20*log10(svT3(1,:)), 'g--' , w, 20*log10(svT4(1,:)), 'r--' , w, 20*log10(svT5(1,:)), 'b'); hold on;
semilogx(w, 20*log10(svT1(2,:)), 'r', w, 20*log10(svT2(2,:)), 'k', ...
     w, 20*log10(svT3(2,:)), 'g--' , w, 20*log10(svT4(2,:)), 'r--' , w, 20*log10(svT5(2,:)), 'b');
hold off;
grid on; xlabel('$\omega $ [rad/s]'); ylabel('$\sigma(T(j\omega)) [dB]$'); 
legend('Decentralizovano', 'Dekupler na $\omega = 0 $', 'Dekupler na $\omega = \omega_0$', 'H$\infty$', 'Potpuna inverzija', 'Location', 'best')

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

f = figure(101);
f.Name = 'Sigma_S_komp';
semilogx(w, 20*log10(svS1(1,:)), 'r', w, 20*log10(svS2(1,:)), 'k', ...
     w, 20*log10(svS3(1,:)), 'g--' , w, 20*log10(svS4(1,:)), 'r--' , w, 20*log10(svS5(1,:)), 'b'); hold on;
semilogx(w, 20*log10(svS1(2,:)), 'r', w, 20*log10(svS2(2,:)), 'k', ...
     w, 20*log10(svS3(2,:)), 'g--' , w, 20*log10(svS4(2,:)), 'r--' , w, 20*log10(svS5(2,:)), 'b');
hold off;
grid on; xlabel('$\omega$ [rad/s]'); ylabel('$\sigma(S(j\omega))$ [dB]'); 
legend('Decentralizovano', 'Dekupler na $\omega = 0 $', 'Dekupler na $\omega = \omega_0$', 'H$\infty$', 'Potpuna inverzija', 'Location', 'best')

if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end

%%
gornja_svS1 = svS1(1,:);
gornja_svS2 = svS2(1,:);
gornja_svS3 = svS3(1,:);
gornja_svS4 = svS4(1,:);
gornja_svS5 = svS5(1,:);

gornja_svT1 = svT1(1,:);
gornja_svT2 = svT2(1,:);
gornja_svT3 = svT3(1,:);
gornja_svT4 = svT4(1,:);
gornja_svT5 = svT5(1,:);

Ms_max_decent = max(gornja_svS1);
Mt_max_decent = max(gornja_svT1);
disp('Decentralizovano upravljanje: ');
disp('Maksimalna vrednost osetljivosti Ms : ');
disp(Ms_max_decent);
disp('Maksimalna vrednost komplementarne osetljivosti Mt : ');
disp(Mt_max_decent);

Ms_max_dekupDC = max(gornja_svS2);
Mt_max_dekupDC = max(gornja_svT2);
disp('Dekuplujuce upravljanje na w = 0: ');
disp('Maksimalna vrednost osetljivosti Ms : ');
disp(Ms_max_dekupDC);
disp('Maksimalna vrednost komplementarne osetljivosti Mt : ');
disp(Mt_max_dekupDC);

Ms_max_dekupW0 = max(gornja_svS3);
Mt_max_dekupW0 = max(gornja_svT3);
disp('Dekuplujuce upravljanje na w = w0: ');
disp('Maksimalna vrednost osetljivosti Ms : ');
disp(Ms_max_dekupW0);
disp('Maksimalna vrednost komplementarne osetljivosti Mt : ');
disp(Mt_max_dekupW0);

Ms_max_Hinf = max(gornja_svS4);
Mt_max_Hinf = max(gornja_svT4);
disp('Dekuplujuce upravljanje na w = 0: ');
disp('Maksimalna vrednost osetljivosti Ms : ');
disp(Ms_max_Hinf);
disp('Maksimalna vrednost komplementarne osetljivosti Mt : ');
disp(Mt_max_Hinf);

Ms_max_Hinv = max(gornja_svS5);
Mt_max_Hinv = max(gornja_svT5);
disp('Dekuplujuce upravljanje na w = 0: ');
disp('Maksimalna vrednost osetljivosti Ms : ');
disp(Ms_max_Hinv);
disp('Maksimalna vrednost komplementarne osetljivosti Mt : ');
disp(Mt_max_Hinv);


%%

i = find(gornja_svS1 >= 1/sqrt(2),1);
disp('Ostvareni propusni opseg kod decentralizovanog upravljanja :');
w0_dec = w(i)

i = find(gornja_svS2 >= 1/sqrt(2),1);
disp('Ostvareni propusni opseg kod dekuplera na nultoj ucestanosti :');
w0_deK0 = w(i)

i = find(gornja_svS3 >= 1/sqrt(2),1);
disp('Ostvareni propusni opseg kod dekuplera na ucestanosti propusnog opsega :');
w0_deKW0 = w(i)

i = find(gornja_svS4 >= 1/sqrt(2),1);
disp('Ostvareni propusni opseg kod Hinf :');
w0_Hinf = w(i)

i = find(gornja_svS5 >= 1/sqrt(2),1);
disp('Ostvareni propusni opseg kod potpune inverzije :');
w0_Hinv = w(i)



