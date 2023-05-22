function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  [m,n] = size(FeaturesMatrix);
  Theta = zeros(n,1);
  B = FeaturesMatrix' * FeaturesMatrix;
  [V, D] = eig(B);
  if any(diag(D) <= 0)
    Theta = vertcat(0, Theta);
    return;
  endif
  %verificam daca matricea este pozitiv definita, in caz contrar
  %adaugam coloana de 0 la inceput si iesim din functie
  r = FeaturesMatrix' * Y - B * Theta;
  v = r;
  tol_squared = tol^2;
  k = 1;
  while k < iter && r' * r > tol_squared
    t = (r' * r) / (v' * B * v);
    Theta = Theta + t * v;
    r_new = r - t * B * v;
    s = (r_new' * r_new) / (r' * r);
    v = r_new + s * v;
    r = r_new;
    k++;
  endwhile
  Theta = vertcat(0, Theta);
  %se executa algoritmul
endfunction
