function [Link] = get_link_matrix(Labyrinth)
  [rows columns] = size(Labyrinth);
  Link = sparse(rows * columns + 2, rows * columns + 2);
  Link = get_adjacency_matrix(Labyrinth);
  %matricea de legaturi este initializzata cu matricea de adiacenta, de asemenea rara
  probability_vector = zeros(1, rows * columns + 2);
  %se declara un vector un vector de probabilitati care va retine numarul de conexiuni
  %al fiecarei celula
  for i = 1:(rows * columns + 2)
    connections = 0;
    for j = 1:(rows * columns + 2)
      if Link(i, j) == 1
        connections++;
        %se numara legaturile fiecarei celule din matrice
      endif
    endfor
    probability_vector(1, i) = connections;
    %se marcheaza numarul in vectorul de probilitati de coloana respectiva celului
  endfor
  for i = 1:(rows * columns + 2)
    for j = 1:(rows * columns + 2)
      if Link(i, j) == 1
        Link(i, j) = Link(i, j) / probability_vector(1, i);
        %se formeaza matricea de legaturi
      endif
    endfor
  endfor
endfunction

