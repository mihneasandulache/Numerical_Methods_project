function [Y, InitialMatrix] = parse_csv_file(file_path)
    f = fopen(file_path, 'r');
    column_names = strsplit(fgetl(f), ',');
    file_contents = textscan(f, '%s', 'Delimiter', '\n');
    InitialMatrix = cell(length(file_contents{1}), length(column_names) ...
                         - 1);
    %parsam matricea din fisierul CSV de tipul cell pentru a putea stoca
    %atat numere cat si siruri de caractere
    Y = zeros(length(file_contents{1}), 1);
    for i = 1:length(file_contents{1})
        values = strsplit(file_contents{1}{i}, ',');
        values = cellfun(@(x) strrep(cellstr(x), '"', ''), values, ...
                                    'UniformOutput', false);
        Y(i) = str2double(values{1});
        %se extrage prima coloana si se converteste la numere
        for j = 2:length(values)
            if ~isnan(str2double(values{j}))
                InitialMatrix{i, j-1} = str2double(values{j});
            else
                InitialMatrix{i, j-1} = cell2mat(values{j});
            endif
        endfor
        %se verifica cealalta parte a matricei initiale, transformand
        %sirurile de caractere ce se pot converti in numere
    endfor
    fclose(f);
endfunction

