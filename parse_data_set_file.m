function [Y, InitialMatrix] = parse_data_set_file(file_path)

    f = fopen(file_path, 'r');
    m = fscanf(f, "%d", 1);
    n = fscanf(f, "%d", 1);
    %se citesc dimensiunile din fisier
    InitialMatrix = cell(m, n);
    %se declara matricea de tip cell pentru a putea stoca atat siruri, cat
    %si numere
    Y = zeros(m,1);

    for i = 1 : m
      for j = 1: (n + 1)
        s = fscanf(f, "%s", 1);
        if !strcmp(s, 'yes') && !strcmp(s, 'no') && ...
          !strcmp(s, 'furnished') && !strcmp(s, 'unfurnished') && ...
          !strcmp(s, 'semi-furnished')
            if j == 1
              Y(i, 1) = str2double(s);
            else
              InitialMatrix{i, j-1} = str2double(s);
            endif
            %in cazul in care nu inalnim unul din cele 5 siruri, atunci
            %avem de a face cu un numar si il convertim ca atare
        else
              InitialMatrix{i, j-1} = s;
              %in caz contrar nu se realizeaza conversia
        endif
      endfor
    endfor

    fclose(f);
endfunction
