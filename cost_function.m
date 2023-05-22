function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)
  Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
  %remodelam parametrii
  J = 0;
  Theta1_grad = zeros(size(Theta1));
  Theta2_grad = zeros(size(Theta2));
  m = size(X,1);
  %numarul de exemple de antrenare
  a1 = [ones(m, 1) X];
  %se adauga coloana de bias
  z2 = a1 * Theta1';
  a2 = 1 ./ (1 + exp(-z2));
  a2 = [ones(size(a2, 1), 1) a2];
  z3 = a2 * Theta2';
  a3 = 1 ./ (1 + exp(-z3));
  %se calculeaza matricea de iesire
  y_new = zeros(m, output_layer_size);
  for i = 1:m
     y_new(i, y(i)) = 1;
     endfor
  J_reg = (lambda/(2*m))*(sum(sum(Theta1(:,2:end) .^ 2)) + sum(sum(Theta2(:,2:end) .^ 2)));
  J = (-1/m)*(sum(diag(y_new' * log(a3)) + diag((1-y_new)' * log(1-a3)))) + J_reg;
  del3 = a3 - y_new;
  %calculăm eroarea pentru stratul de ieșire (output layer) prin
  % diferențierea funcției de cost în raport cu ieșirile
  % rețelei neuronale
  del2 = (del3 * Theta2).*[ones(m,1) ((1 ./ (1 + exp(-z2))) .* (1 - (1 ./ (1 + exp(-z2)))))];
  %calculam eroarea pentru stratul ascuns prin propagarea erorii de la
  % stratul de ieșire până la stratul ascuns
  del1 = (del2(:, 2:end))'*a1;
  del2 = del3' * a2;
  Theta1_grad = Theta1_grad + del1/m;
  Theta2_grad = Theta2_grad + del2/m;
  Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + (lambda/m)*(Theta1(:,2:end));
  Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + (lambda/m)*(Theta2(:,2:end));
  %calculăm gradientul pentru fiecare strat folosind matricele de eroare
  % obținute mai devreme și matricele de intrări corespunzătoare
  grad = [Theta1_grad(:) ; Theta2_grad(:)];
endfunction