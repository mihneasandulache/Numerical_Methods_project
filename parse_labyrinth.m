function [Labyrinth] = parse_labyrinth(file_path)
  f = fopen(file_path, 'r');
    rows = fscanf(f, "%d", 1);
    columns = fscanf(f, "%d", 1);
    for i = 1 : rows
        for j = 1 : columns
            Labyrinth(i,j) = fscanf(f, "%d", 1);
        endfor
    endfor
%se citesc dimensiunile si matricea labirintului
  fclose(f);
endfunction

