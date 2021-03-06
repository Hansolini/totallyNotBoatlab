%% Task 5.2 a)
% Params to give pwelch function
x_deg = psi_w(2,:);     %Second row in matrix containing the influences
x_rad = x_deg*pi/180;   %Convert to radians
window = 4096;          %Window given by task 
noverlap = [];          %Empty flag in function
nfft = [];              %Empty flag in function
fs = 10;                %Sampling freq. in Hz. Remember to convert to rad/s

% Calculate and estimate for PSD
[pxx_hz,f] = pwelch(x_rad,window,noverlap,nfft,fs);

% Output from calculation needs to be converted to power s/rad and rad
pxx = pxx_hz./(2*pi);
w = f.*2*pi;

% Plot the PSD
plot(w,pxx);
axis([0 pi/2 0 1.5*10^(-3)]);
xticks([0 pi/8 pi/4 3*pi/8 pi/2 5*pi/8 3*pi/4 7*pi/8 pi])
xticklabels({'0', '\pi/8', '\pi/4', '3\pi/8', '\pi/2', '5\pi/8', '3\pi/4', '7\pi/8', 'pi'})
xlabel('\omega [rad/s]');
ylabel('\psi_\omega [rad]');
grid on;

%% Task 5.2 c)
% Find resonance frequence w0
[w0_val, w0_ind] = max(pxx);
w0 = w(w0_ind);

%% Task 5.2 d)
% Calculate analytical solution of PSD given sigma and lambda
sigma = sqrt(w0_val);
lambda = 0.087;
K_w = 2*lambda*w0*sigma;
pxx_an = ((w.*K_w).^2)./(w.^4 + 2*w0^2*(2*lambda^2 - 1)*w.^2 + w0^4);

% Compare with two other values for lambda
lambda_a = 0.11;
K_wa = 2*lambda_a*w0*sigma;
pxx_ana = ((w.*K_wa).^2)./(w.^4 + 2*w0^2*(2*lambda_a^2 - 1)*w.^2 + w0^4);
lambda_b = 0.07;
K_wb = 2*lambda_b*w0*sigma;
pxx_anb = ((w.*K_wb).^2)./(w.^4 + 2*w0^2*(2*lambda_b^2 - 1)*w.^2 + w0^4);

% 
hold on
plot(w, pxx_ana, '-.');
plot(w, pxx_an);
plot(w, pxx_anb, '-.');
legend('Estimated PSD','\lambda = 0.110','\lambda = 0.087','\lambda = 0.070')
hold off