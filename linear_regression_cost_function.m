function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  m = length(Y);
  Error = 0;
  Theta = Theta(2:end);
  for i = 1:m
    Error = Error + (FeatureMatrix(i, :) * Theta - Y(i)) * (FeatureMatrix(i, :) * Theta - Y(i));
  endfor
  Error = Error / (2 * m);
  %se calculeaza functia de cost a regresiei liniare conform breviarului
endfunction
