close all;
clc;



%% Ravnotezno stanje
m = load('parameters');

syms xa xb y Fa Fb real
syms Ca Cb kw kv V positive

dxa = 1/V*(Fa*Ca - (Fa + Fb)*xa);
dxb = 1/V*(Fb*Cb - (Fa + Fb + kv)*xb);
y = -log10(sqrt((xb - xa)^2/4 + kw) - (xb - xa)/2);


xa = m.xa0;

eqns = [eval(dxa) == 0, eval(dxb) == 0, y == m.y];
params = [xb Fa Fb];

S = solve(eqns, params);


disp('xb0 :');
disp(vpa(S.xb, 2));
disp('Fa0 :');
disp(vpa(S.Fa, 2));
disp('Fb0 :');
disp(vpa(S.Fb, 2));

kv = m.kv;
Ca= m.Ca;
Cb = m.Cb;
kw = m.kw;
V = m.V;



disp('xb0 :');
disp(eval(S.xb));
disp('Fa0 :');
disp(eval(S.Fa));
disp('Fb0 :');
disp(eval(S.Fb));

y0 = m.y;
xa0 = m.xa0;
xb0 = double(eval(S.xb));
Fa0 = double(eval(S.Fa));
Fb0 = double(eval(S.Fb));

save('set_point', 'xa0', 'xb0', 'Fa0', 'Fb0', 'y0');

%% Jakobijan Linearizacija

m = load('parameters');

syms xa xb y Fa Fb real
syms Ca Cb kw kv V positive

dxa = 1/V*(Fa*Ca - (Fa + Fb)*xa);
dxb = 1/V*(Fb*Cb - (Fa + Fb + kv)*xb);
y = -log10(sqrt((xb - xa)^2/4 + kw) - (xb - xa)/2);

z = [xa; y];
u = [Fa; Fb];


disp('A: ' );
A = [diff(dxa,xa), diff(dxa,xb); diff(dxb,xa), diff(dxb,xb)];
disp(A);
B = [diff(dxa,u(1)), diff(dxa,u(2)); diff(dxb,u(1)), diff(dxb,u(2))];
disp('B: ' );
disp(B);
C = [diff(z(1),xa), diff(z(1),xb); diff(z(2),xa), diff(z(2),xb)];
disp('C: ' );
disp(C);
D = [diff(z(1),u(1)), diff(z(1),u(2)); diff(z(2),u(1)), diff(z(2),u(2))];
disp('D: ' );
disp(D);

syms s 

G = C*(s*eye(2) - A)^-1*B;
G = simplify(G);
disp('G:');
disp(G);



xa = xa0;
xb = xb0;

kv = m.kv;
Ca= m.Ca;
Cb = m.Cb;
kw = m.kw;
V = m.V;
Fa = eval(S.Fa);
Fb = eval(S.Fb);


A = eval(A); 
B = eval(B);
C = eval(C); 
D = eval(D);

disp('A: ' );
disp(A);
disp('B: ' );
disp(B);
disp('C: ' );
disp(C);
disp('D: ' );
disp(D);

%% Model u prostoru stanja

Gss = ss(A,B,C,D);
Gtf = tf(Gss);
Gzpk = zpk(Gtf);

%% Polovi i nule

disp("Poles: ");
p = pole(minreal(Gss));


disp(p);

disp("Zeros: ");
z = tzero(minreal(Gss));
disp(z);

%%
save('linear_model', 'Gss', 'Gzpk');

%%
Dy = [4.3e-8 0; 0 0.19]; %Vrednosit malih signala
Du = [Fa0*2 - Fa0 0; 0 Fb0*2 - Fb0];
Dd = y0;

G_s = Dy^-1*Gtf*Du;
%disp('scaled: ');
%disp(G_s);

save('scaling_factors', 'Dy', 'Du', 'Dd');
