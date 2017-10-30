%% Task 5.2 d)
% Calculate analytical solution of PSD given sigma and lambda
sigma = sqrt(w0_val);
lambda = %VALUE FOR LAMBDA
K_w = 2*lambda*w0*sigma;
pxx_an = ((w.*K_w).^2)./(w.^4 + 2*w0^2*(2*lambda^2 - 1)*w.^2 + w0^4);