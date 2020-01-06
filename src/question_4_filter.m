function Hd = question_4_filter
%QUESTION_4_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.7 and Signal Processing Toolbox 8.3.
% Generated on: 06-Jan-2020 03:16:34

% Chebyshev Type I Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 5000;  % Sampling Frequency

Fpass = 0.62831853072;  % Passband Frequency: 0.2*pi
Fstop = 1.5707963268;   % Stopband Frequency: 0.5*pi
Apass = 1;              % Passband Ripple (dB)
Astop = 15;             % Stopband Attenuation (dB)
match = 'stopband';     % Band to match exactly

% Construct an FDESIGN object and call its CHEBY1 method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'cheby1', 'MatchExactly', match);

% [EOF]
