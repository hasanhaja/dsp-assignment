data = readmatrix('Greenland_full_monthly 1901-2018.xlsx');

% Extract all the individual years
years = annual_op(data(1:end, 1), 'first');

% Extract all the raw data
smb = data(1:end, 3);
nao = data(1:end, 4);
lsst = data(1:end, 5);
l48n = data(1:end, 6);

% Calculate the annual averages and the sum for L48N
smb_avg = annual_op(smb, 'mean');
nao_avg = annual_op(nao, 'mean');
lsst_avg = annual_op(lsst, 'mean');
l48n_sum = annual_op(l48n, 'sum');

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
plot(years, l48n_sum), title('Accumulative I48N per year'), xlabel('Year'), ylabel('I48N (number per year)')
grid on, grid minor