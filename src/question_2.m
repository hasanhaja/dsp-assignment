% Model of discrete-time signal

t = (round(-5*pi)):(round(5*pi));
x = arrayfun(@question_2_signal, t);

figure, stem(t, x)
title('Discrete-time signal')
xlabel('time (n)'), ylabel('Amplitude')
grid on, grid minor

% Fast fourier transform of x
X = fft(x);
X_real = real(X);
X_imag = imag(X);

% Plotting the FT, X
figure, plot(X_real)
title('Real part of FT of discrete-time signal')
xlabel('frequency (Hz)'), ylabel('Amplitude')
grid on, grid minor

figure, plot(X_imag)
title('Imaginary part of FT of discrete-time signal')
xlabel('frequency (Hz)'), ylabel('Amplitude')
grid on, grid minor


