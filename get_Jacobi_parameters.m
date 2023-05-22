function [G, c] = get_Jacobi_parameters(Link)
  [rows columns] = size(Link);
  rows = rows - 2;
  columns = columns - 2;
  G = sparse(rows, columns);
  c = sparse(rows, 1);
  G = Link(1:rows, 1:columns);
  c = Link(1:rows, rows + 1);
  %se preiau matricea si vectorul de iteratie din matricea legaturilor
  %conform cerintei
endfunction
