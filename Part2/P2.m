%% Task 5.2 a)
% Params to give pwelch function
x_deg = psi_w(2,:);     %Second row in matrix containing the influences
x_rad = x_deg*pi/180;   %Pretty self-explanatory
window = 4096;          %Window given by task 
noverlap = [];          %Empty flag in function
nfft = [];              %Empty flag in function
fs = 10;                %Sampling freq. in Hz. Remember to convert to rad/s

% Calculate and estimate for PSD
[pxx_hz,f] = pwelch(x_rad,window,noverlap,nfft,fs);

% Output from calculation needs to be converted to power s/rad and rad
pxx = pxx_hz./(2*pi);
w = f.*2*pi;

plot(w);

%% Task 5.2 a)
% 