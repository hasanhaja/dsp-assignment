function folded = annual_op(data, option)
%ANNUAL_AVERAGE This function calculates the annual average or sum of the data.
%   This function reshapes the data from a one dimensional vector
%   to a two dimentional vector, where each row represents the data points for a year.
%   Then, depending on the option, it either averages or sums the annual
%   data and returns a vector of the values.


% todo error check if data set is multiple of 12

if mod(length(data), 12) ~= 0
    throw(MException('MATLAB:invalidData','The dataset cannot be equally divided by 12 for annual operations.'));
end

data2d = (reshape(data, [12, length(data)/12]))';    

folded = zeros(1, length(data2d));

% This switch expression determines the operation to be performed.
switch lower(option)
    case 'mean'
        operation = @(vector) mean(vector);
    case 'sum'
        operation = @(vector) fold(@plus, vector);
    case 'first'
        operation = @(vector) vector(1);
    otherwise
        throw(MException('MATLAB:invalidOption','Option is unrecognized. Try "Mean" or "Sum".'));
end

for n = 1:length(data2d)
    folded(1, n) = operation(data2d(n, :));
end

end

