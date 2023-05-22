function path = heuristic_greedy(start_position, probabilities, adjacency_matrix)
  [rows, columns] = size(adjacency_matrix);
  path = [start_position];
  %se adauga in vectorul de cale pozitia de start
  visited = zeros(rows - 2, 1);
  %se declara un vector pentru a marca celulele vizitate
  visited(path) = 1;
  while !isempty(path)
    max_probability = -1;
    neigh = -1;
    position = path(end);
    if adjacency_matrix(position, rows - 1) == 1
      path = [path; rows - 1];
      return;
      %in cazul in care celula in care ne aflam are legatura directa cu starea de WIN
      %se iese din functie, deoarece am descoperit un drum castigator
    endif
    for i = 1:(rows - 2)
      if adjacency_matrix(position, i) == 1 && visited(i) == 0 && probabilities(i) > max_probability
        neigh = i;
        max_probability = probabilities(i);
        %pentru fiecare vecin al celulei curente se calculeaza probailitatea maxima de a ajunge in starea
        %de WIN si se retin atat probabilitatea, cat si vecinul
      endif
    endfor
    if max_probability == -1 && adjacency_matrix(position, rows) == 1
      path = path(1:end - 1, :);
      %in cazul in care nu s-a gasit un astfel de vecin si avem legatura directa cu starea de LOSE
      %se scoate celula curenta din vectorul drumului
    endif
    if neigh ~= -1
      visited(neigh) = 1;
      path = [path; neigh];
      %in caz contrar, se marcheaza vecinul cu probabilitatea cea mai mare ca vizitate si se adauga in
      %vectorul drumului
    endif
  endwhile
  return;
  %se returneaza vectorul drumului
endfunction

