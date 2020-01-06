% Generate the signal
Fs = 1000;
N = 1000;
M = 30;
delta_t = 1/Fs;
timestep = 0:N;     % n
f = 0:Fs/2;         % all frequencies.
          
% TODO: use randn to generate some noise and add that in with a factor to
% control how much noise.
noise_coef = 0.1;
noise_raw = randn(size(timestep));
noise = noise_raw(1:end-1) * noise_coef;

x_wo_noise = 0;        % Signal without noise
x = zeros(1, N);       % preallocating the vector with just zeroes

% These nested for loops generate the raw signal
for n = 1:N
    for i = 1:M
        % This for loop sums up all the frequency components
        x_wo_noise = x_wo_noise + sin(2*pi*f(i)*n*delta_t);
    end
    
    x(1, n) = x_wo_noise;
end

x = x + (std(x)*noise);

figure, plot(x)
title('Raw signal with noise'), xlabel('Timestep (n)'), ylabel('Amplitude')
grid on, grid minor

% Power Spectrum Density calculations
% PSD by Welch's method: Chebyshev window
len_coef = 5;
win_size = floor(length(x)/len_coef);
win_over = 25;

win_coef = chebwin(win_size);

num_of_win = 1 + round((len_coef - 1)/(1-(win_over/100)));
nfft = length(x);

[welchp, f11] = pwelch(x, win_coef, round(win_size*win_over/100), nfft, Fs, "onesided", "psd");
figure, plot(f11, 20*log10(welchp))
title(['Welch method, num of windows = ' num2str(num_of_win), ', window = Chebyshev']), xlabel('frequency (Hz)'), ylabel('PSD magnitude (dB)')
grid on, grid minor

% The sinusoidal components M can be seen at the 30Hz frequency in the PSD