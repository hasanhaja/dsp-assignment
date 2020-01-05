function y = question_2_signal(t)
%QUESTION_2_SIGNAL This function models the discrete-time signal
%   For the given input time value, this function returns the appropriate y
%   value.
switch t
    case {-3, -1, 1, 3}
        y = -1;
    case {-2, 0, 2}
        y = 1;
    otherwise
        y = 0;
end

end

