function [svS, svT] = sigma_S_T( K, Du, Dy, G_tf_norm, w )

K_norm = Du^-1*K*Dy;

W = G_tf_norm * K_norm;

T = W*(eye(2) + W)^-1;
svT = sigma(T, w);
S = eye(2) - T;
svS = sigma(S, w);

end

