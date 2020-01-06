% Generate the signal

Fs = 1000;
N = 1000;
M = 30;
delta_t = 1/Fs;
t = 0:delta_t:N;
f = 0:Fs/2;     % all frequencies.
                % TODO: There needs to be M of them
          
% TODO: use randn to generate some noise and add that in with a factor to
% control how much noise.
noise = 0;

x_wo_noise = 0;
x = zeros(1, N);       % preallocating the vector with just zeroes

% TODO: Verify if the logic is correct
for n = 1:N
    for i = 1:M
        % This for loop sums up all the frequency components
        x_wo_noise = x_wo_noise + sin(2*pi*f(i)*n*delta_t);
    end
    
    x(1, n) = x_wo_noise + noise;
end

figure, plot(x)

% Power Spectrum Density calculations
% PSD by Welch's method: Chebyshev window
len_coef = 4;
win_size = floor(length(x)/len_coef);
win_over = 50;

% TODO: Use window designer
win_coef = chebwin(win_size);

num_of_win = 1 + round((len_coef - 1)/(1-(win_over/100)));
nfft = length(x);

[welchp, f11] = pwelch(x, win_coef, round(win_size*win_over/100), nfft, Fs, "onesided", "psd");
figure, plot(f11, 20*log10(welchp))


% TODO: Visualize using pcolor