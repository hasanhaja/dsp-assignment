function folded = annual_op(data, option)
%ANNUAL_AVERAGE This function calculates the annual average or sum of the data.
%   This function reshapes the data from a one dimensional vector
%   to a two dimentional vector, where each row represents the data points for a year.
%   Then, depending on the option, it either averages or sums the annual
%   data and returns a vector of the values.

% This checks if the dataset used has 12 months for every year by checking
% if the overall dataset is divisble by 12. The assumption here is that
% every month, for a given piece of data, has only one data point per
% month.
if mod(length(data), 12) ~= 0
    throw(MException('MATLAB:invalidData','The dataset cannot be equally divided by 12 for annual operations.'));
end

% By reshaping the data to a matrix of month x years, the folding
% processing can be iterated.
data2d = (reshape(data, [12, length(data)/12]))';    

% Initializes the return variable with an empty vector of zeros.
folded = zeros(1, length(data2d));

% This switch expression determines the operation to be performed.
switch lower(option)
    case 'mean'
        % This branch sets the operation function to the mean function.
        operation = @(vector) mean(vector);
    case 'sum'
        % This branch sets the operation function to the fold the vector by
        % summing all the values.
        operation = @(vector) fold(@plus, vector);
    case 'first'
        % This branch sets the operation to return the first value of the
        % vector.
        operation = @(vector) vector(1);
    otherwise
        % If none of the correct options are selected, then an error is
        % thrown. This can be caught and handled when used.
        throw(MException('MATLAB:invalidOption','Option is unrecognized. Try "Mean" or "Sum".'));
end

% The return variable is called folded because this is like the fold/reduce
% function in functional programming languages, where a collection reduces
% to a single value. Regardless of the exact operation, it is a form of
% folding.
for n = 1:length(data2d)
    folded(1, n) = operation(data2d(n, :));
end

end

