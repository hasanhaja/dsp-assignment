data = readmatrix('Greenland_full_monthly 1901-2018.xlsx');

smb = data(1:end, 3);
nao = data(1:end, 4);
lsst = data(1:end, 5);
l48n = data(1:end, 6);


smb_avg = annual_op(smb, 'mean');
nao_avg = annual_op(nao, 'mean');
lsst_avg = annual_op(lsst, 'mean');
l48n_avg = annual_op(l48n, 'sum');

% TODO: plot annual averages
