% model discrete-time signal
%t = (-5*pi):(5*pi);     % this goes from -5pi to 5 pi
                        % TODO: Consider linspace

t = (round(-5*pi)):(round(5*pi));
x = arrayfun(@question_2_signal, t);

figure, stem(t, x)

% Fast fourier transform of x
X = fft(x);
X_real = real(X);
X_imag = imag(X);

% Plotting the FT, X
% TODO: Titles and labels
figure, plot(X_real)
figure, plot(X_imag)


