% SUMMARY
% The autocorrelation of nao results in nothing and this suggests that nao
% might be closer to white noise.

data = readmatrix('Greenland_full_monthly 1901-2018.xlsx');

% Extract all the individual years
years_raw = data(1:end, 1);
years = annual_op(years_raw, 'first');
months = 1:length(years_raw);

% Extract all the raw data
smb = data(1:end, 3);
nao = data(1:end, 4);
lsst = data(1:end, 5);
i48n = data(1:end, 6);

% Plot raw data
% The purpose of this was to visualize what the raw data looked like to see
% if anything was being lost in the averages and sum calculation.
figure
plot(months, smb), title('SMB per month'), xlabel('Months (1901-2018)'), ylabel('Surface Mass Balance')
grid on, grid minor

figure
plot(months, nao), title('NAO per month'), xlabel('Months (1901-2018)'), ylabel('North Atlantic Oscillation')
grid on, grid minor

figure
plot(months, lsst), title('LSST per month'), xlabel('Months (1901-2018)'), ylabel('Labrador Sea Surface Temperature')
grid on, grid minor

figure
plot(months, i48n), title('I48N per month'), xlabel('Months (1901-2018)'), ylabel('I48N (number per month)')
grid on, grid minor

% Calculate the annual averages and the sum for L48N
smb_avg = annual_op(smb, 'mean');
nao_avg = annual_op(nao, 'mean');
lsst_avg = annual_op(lsst, 'mean');
i48n_sum = annual_op(i48n, 'sum');

% Plots of calculated data
figure
plot(years, smb_avg), title('Average SMB per year'), xlabel('Year'), ylabel('Average Surface Mass Balance')
grid on, grid minor

figure
plot(years, nao_avg), title('Average NAO per year'), xlabel('Year'), ylabel('Average North Atlantic Oscillation')
grid on, grid minor

figure
plot(years, lsst_avg), title('Average LSST per year'), xlabel('Year'), ylabel('Average Labrador Sea Surface Temperature')
grid on, grid minor

figure
plot(years, i48n_sum), title('Accumulative I48N per year'), xlabel('Year'), ylabel('I48N (number per year)')
grid on, grid minor

% Time varying correlation of each input and I48N
% Windowing is useful to capture time information that is lost in the
% fourier transform. It has no effect on cross correlation.
smb_corr = xcorr(smb, i48n);
nao_corr = xcorr(nao, i48n);
lsst_corr = xcorr(lsst, i48n);

figure, plot(smb_corr)
title('Cross correlation of SMB and I48N')
grid on, grid minor

figure, plot(nao_corr)
title('Cross correlation of NAO and I48N')
grid on, grid minor

figure, plot(lsst_corr)
title('Cross correlation of LSST and I48N')
grid on, grid minor

% XCorrelation of the annual averages with the accumulative iceberg number
smb_avg_corr = xcorr(smb_avg, i48n_sum);
nao_avg_corr = xcorr(nao_avg, i48n_sum);
lsst_avg_corr = xcorr(lsst_avg, i48n_sum);

figure, plot(smb_avg_corr)
title('Cross correlation of Average SMB and Accumulative I48N')
grid on, grid minor

figure, plot(nao_avg_corr)
title('Cross correlation of Average NAO and Accumulative I48N')
grid on, grid minor

figure, plot(lsst_avg_corr)
title('Cross correlation of Average LSST and Accumulative I48N')
grid on, grid minor

% Findings
% Autocorrelation results

nao_auto = xcorr(nao);
nao_avg_auto = xcorr(nao_avg);
% Autocorrelation of Nao and Nao_avg results in nothing. This suggests
% that it is close to white noise.