close all;

w0 = 0.0016;
%%

model = load('linear_model.mat');
Gss = model.Gss;
Gzpk = model.Gzpk;

Cdiag = [1 0; 0 1];
Coffdiag = [0 1; 1 0];

w = logspace(-6, 0, 1000);

for i = 1 : length(w)
    G = freqresp(Gss, w(i));
    RGA = G.*(G^-1).';

    RGA11(i) = RGA(1, 1);
    RGA12(i) = 1 - RGA11(i);

    RGA_num_diag(i) = sum(sum(abs(RGA - Cdiag)));
    RGA_num_offdiag(i) = sum(sum(abs(RGA - Coffdiag)));
end

f = figure(201);
f.Name = 'RGA';
figure(f);
    subplot(2, 1, 1);
    semilogx(w, abs(RGA11), 'black');
    hold on;
        grid on;
        xlabel('$\omega$ [rad/s]');
        ylabel('$\|RGA_{ij}(\omega)\|$');
        xlim([w(1) w(end)]);
   semilogx(w, abs(RGA12), 'red');
   hold off;
        legend('$\|RGA_{11}(\omega)\|$', '$\|RGA_{12}(\omega)\|$');

   subplot(2, 1, 2);
    semilogx(w, RGA_num_diag, 'black');
    hold on;
        grid on;
        xlabel('$\omega$ [rad/s]');
        ylabel('$\|RGA_{ij}(\omega)\|$');
        xlim([w(1) w(end)]);
   semilogx(w, RGA_num_offdiag, 'red');
   hold off;
        legend('$Diagonal$', '$Off-diagonal$');

fontsize(f, 8, "points");
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 


%%

w = [0, w0, 100];
for i = 1 : length(w)
    G = freqresp(Gss, w(i));
    if i > 1
        G = (real_inverse(G))^-1;
        %G = abs(G);
    end
    [S, V, D] = svd(G);


f = figure(201 + i);
f.Name = "RGA_" + num2str(i);
figure(f);
    subplot(2, 1, 1);
    u1 = S(1, :);
    u2 = S(2, :);
    plot([0, u1(1)], [0, u1(2)],'k');
    hold on;
    plot([0, u2(1)], [0, u2(2)],'r');
        xlim([-1, 1]);
        ylim([-1, 1]);
        grid on;
        xlabel('$F_a$ [l/s]');
        ylabel('$F_b$ [l/s]');

   subplot(2, 1, 2);
   D = D';
   y1 = D(1, :);
   y2 = D(2, :);

   gain1 = "Gain: " + num2str(20*log10(V(1, 1))) + " dB";
   gain2 = "Gain: " + num2str(20*log10(V(2, 2))) + " dB";

   plot([0, y1(1)], [0, y1(2)],'k');
    hold on;
   plot([0, y2(1)], [0, y2(2)],'r');
        xlim([-1, 1]);
        ylim([-1, 1]);
        grid on;
        xlabel('$x_a$ [mol/l]');
        ylabel('$y$ [pH]');
        legend(gain1, gain2, 'Location', 'southwest');


fontsize(f, 8, "points");
if(SAVE)
    saveas(f,[path '\' f.Name '.eps'],'epsc');
end 

end

