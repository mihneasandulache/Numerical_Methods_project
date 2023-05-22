function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  data = [X y];
  n = size(data, 1);
  index = randperm(n);
  shuffled_data = data(index, :);
  n_train = round(percent * n);
  X_train = shuffled_data(1:n_train, 1:end-1);
  y_train = shuffled_data(1:n_train, end);
  X_test = shuffled_data(n_train+1:end, 1:end-1);
  y_test = shuffled_data(n_train+1:end, end);
  %se amesteca datele de la functia anterioara si se impart pentru teste
  %si antrenarea modelului ce va realiza recunoasterea cifrelor
endfunction

