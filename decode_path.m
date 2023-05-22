function [decoded_path] = decode_path(path, lines, cols)
  Aux = zeros(lines, cols);
  for i = 1:lines
    for j = 1:cols
        Aux(i, j) = (i - 1) * cols + j;
        %se creeaza matricea auxiliara pentru a usura decodificarea labirintului
    endfor
  endfor
  k = 1;
  aux = path;
  decoded_path = zeros(length(path) - 1, 2);
  while path(1) != lines * cols + 1
    i = 1;
    j = 1;
    ok = 1;
    while i <= lines && ok
      j = 1;
      while j <= cols && ok
        if path(1) == Aux(i, j)
          ok = 0;
          decoded_path(k, 1) = i;
          decoded_path(k, 2) = j;
          %se parcurge matricea auxiliara si se verifica daca elementul curent se afla in vectorul
          %drumului, caz in care se retin coordonatele pe linia k a matricei drumului decodificat si
          %se iese din iteratie pentru optimizare
          k = k + 1;
          path = aux(k:end);
          %se elimina celula decodificata din vector
        endif
        j = j + 1;
      endwhile
      i = i + 1;
    endwhile
  endwhile
endfunction

