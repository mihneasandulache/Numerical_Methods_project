function [X, y] = load_dataset(path)
    data = load(path);
    X = data.X;
    y = data.y;
    %se preiau datele din fisierul de intrare
endfunction