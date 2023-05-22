function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);
  for i = 1:iter
    Theta = Theta - ((alpha / m) * ((FeatureMatrix * Theta - Y)' * ...
            FeatureMatrix)');
  endfor
  Theta = vertcat(0, Theta);
  %se realizeaza algortimul gradientului descendent conform breviarului
endfunction

