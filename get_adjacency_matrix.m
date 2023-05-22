function [Adj] = get_adjacency_matrix(Labyrinth)
  [rows, columns] = size(Labyrinth);
  Adj = sparse(rows * columns + 2, rows * columns + 2);
  %se declara matricea adiacenta rara de dimensiunile matricei labirint

  Aux = zeros(rows, columns);
  for i = 1:rows
    for j = 1:columns
        Aux(i, j) = (i - 1) * columns + j;
    endfor
  endfor
  %se creeaza o matrice auxiliara ce contine sirul de numere 1, 2, ..., rows * columns
  %pentru a facilita construirea matricei de adiacenta

  for i = 1:rows
    for j = 1:columns
      man = Labyrinth(i, j);
      b0 = mod(man, 2);
      man = floor(man / 2);
      b1 = mod(man, 2);
      man = floor(man / 2);
      b2 = mod(man, 2);
      man = floor(man / 2);
      b3 = mod(man, 2);
      %extragem cei 4 biti corespunzatori codificarii binare
      if i > 1 && b3 == 0 && Adj(Aux(i, j), Aux(i - 1, j)) == 0
        Adj(Aux(i, j), Aux(i - 1, j)) = 1;
        Adj(Aux(i - 1, j), Aux(i, j)) = 1;
        %daca exista legatura intre celula curenta si cea de deasupra se marcheaza in matricea de adiacenta
      endif
      if i == 1 && b3 == 0
        %daca exista legatura intre celula curenta si cea de deasupra si ne aflam pe prima linie,
        %denota faptul ca celula curenta are legatura directa cu starea de WIN si se marcheaza
        %in matricea de adiacenta
        Adj(Aux(i, j), rows * columns + 1) = 1;
      endif
      if i < rows && b2 == 0 && Adj(Aux(i, j), Aux(i + 1, j)) == 0
        Adj(Aux(i, j), Aux(i + 1, j)) = 1;
        Adj(Aux(i + 1, j), Aux(i, j)) = 1;
        %daca exista legatura intre celula curenta si cea de jos se marcheaza in matricea de adiacenta
      endif
      if i == rows && b2 == 0
        Adj(Aux(i, j), rows * columns + 1) = 1;
        %daca exista legatura intre celula curenta si cea de jos si ne aflam pe ultima linie
        %denota faptul ca celula curenta are legatura directa cu starea de WIN si se marcheaza
        %in matricea de adiacenta
      endif
      if j < columns && b1 == 0 && Adj(Aux(i, j), Aux(i, j + 1)) == 0
        Adj(Aux(i, j), Aux(i, j + 1)) = 1;
        Adj(Aux(i, j + 1), Aux(i, j)) = 1;
        %daca exista legatura intre celula curenta si cea din dreapta se marcheaza in matricea de adiacenta
      endif
      if j == columns && b1 == 0
        Adj(Aux(i, j), rows * columns + 2) = 1;
        %daca exista legatura intre celula curenta si cea din dreapta si ne aflam pe ultima coloana
        %denota faptul ca celula curenta are legatura directa cu starea de LOSE si se marcheaza
        %in matricea de adiacenta
      endif
      if j > 1 && b0 == 0 && Adj(Aux(i, j), Aux(i, j - 1)) == 0
        Adj(Aux(i, j), Aux(i, j - 1)) = 1;
        Adj(Aux(i, j - 1), Aux(i, j)) = 1;
        %daca exista legatura intre celula curenta si cea din stanga se marcheaza in matricea de adiacenta
      endif
      if j == 1 && b0 == 0
          Adj(Aux(i, j), rows * columns + 2) = 1;
        %daca exista legatura intre celula curenta si cea din stanga si ne aflam pe prima coloana
        %denota faptul ca celula curenta are legatura directa cu starea de LOSE si se marcheaza
        %in matricea de adiacenta
      endif
    endfor
  endfor
  Adj(rows * columns + 1, rows * columns + 1) = 1;
  Adj(rows * columns + 2, rows * columns + 2) = 1;
endfunction


