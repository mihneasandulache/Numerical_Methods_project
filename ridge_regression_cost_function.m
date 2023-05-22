function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, ...
                                                  lambda)
    [m, n] = size(FeatureMatrix);
    s = 0;
    ThetaSum = 0;
    for i = 1 : m
        h = 0;
        for j = 1 : n
            h = h + FeatureMatrix(i, j) * Theta(j + 1, 1);
        endfor
        s = s + (Y(i, 1) - h) ^ 2;
        endfor
    for j = 1 : n
        ThetaSum = ThetaSum + Theta(j + 1, 1) ^ 2;
    endfor

    Error = s / (2 * m) + lambda * ThetaSum;
    %se calculeaza functia de cost conform algoritmului descris

endfunction
