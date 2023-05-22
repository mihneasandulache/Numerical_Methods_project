function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
  m = size(X,1);
  a1 = [ones(1,m); X'];
  Theta1 = reshape(weights(1:hidden_layer_size*(input_layer_size+1)), hidden_layer_size, input_layer_size + 1);
  Theta2 = reshape(weights((hidden_layer_size*(input_layer_size+1)+1):length(weights)), output_layer_size, hidden_layer_size + 1);
  %se remodeleaza ponderile
  z2 = Theta1 * a1;
  a2 = 1 ./ (1 + exp(-z2));
  a2 = [ones(1,m); a2];
  z3 = Theta2 * a2;
  a3 = 1 ./ (1 + exp(-z3));
  %aplicam algoritmul de predictie folosind forward propagation
  [~, classes] = max(a3);
  classes = classes';
endfunction