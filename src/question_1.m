% NOTE: The church names have been relabeled using numbers instead of alphabets
data = readmatrix('question_1_data.xlsx');

% Remapping relabelling back to original labels
churches_labels = {'A','B','C','D','E','F','G','H','I','J'};
churches_keys = data(1:end, 1);
churches = containers.Map(churches_keys, churches_labels);

x = data(1:end, 2);     % Distance from Central Business District in miles
y = data(1:end, 3);     % Percentage of membership growth

figure
scatter(x, y)
title('Distance from CBD vs membership growth')
xlabel('Distance from Central Business District (miles)'), ylabel('Membership growth (%)')
grid on, grid minor

% Mean and standard deviation of x and y
x_avg = mean(x);
x_std = std(x);

y_avg = mean(y);
y_std = std(y);

% Autocorrelation of x and y
x_auto = xcorr(x);
y_auto = xcorr(y);

% TODO: Labels and title and potentially zero padding
figure, plot(x_auto)
figure, plot(y_auto)

corr_coef = xcorr(x, y);

figure, plot(corr_coef)

% Linear regression (stepwiselm or fitlm?)
model_fit = fitlm(x, y);

figure, plot(model_fit), grid on, grid minor

% Prediction of membership growth of churches
k_dist = 15;
l_dist = 3;
m_dist = 18;

k_growth = model_fit.predict(k_dist);
l_growth = model_fit.predict(l_dist);
m_growth = model_fit.predict(m_dist);