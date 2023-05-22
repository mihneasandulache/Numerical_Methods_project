function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, ...
                                                  lambda)
    Error = 0;
    [m, n] = size(FeatureMatrix);
    for i = 1 : m
        s = 0;
        for j = 1 : n
            s = s + FeatureMatrix(i, j) * Theta(j + 1, 1);
        endfor
        Error = Error + (Y(i, 1) - s) * (Y(i, 1) - s);
    endfor

    Error = Error / m + lambda * (norm(Theta, 1));
%se calculeaza functia de cost
endfunction