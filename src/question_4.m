% filter parameters
wp = 0.2*pi; ws = 0.5*pi;
ap = 1; as = 15;     % dB

Fs = 5000;
T_min = 0; T_max = 1;
Fpulse = 10;
pulse_width = 0.5*(1/Fpulse);

t = T_min: 1/Fs : T_max;
d = (T_min : 1/Fpulse : T_max)';
y = pulstran(t, d, 'rectpuls', pulse_width);

% filter with Chebyshev method

z = filter(lowpassNum, 1, y);
figure, plot(t, z);
