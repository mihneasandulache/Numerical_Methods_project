function [matrix] = initialize_weights(L_prev, L_next)
  if L_prev < L_next
      matrix = zeros(L_next, L_prev + 1);
      return;
  endif
  matrix = zeros(L_prev, L_next);
  epsilon = sqrt(6) \ sqrt(L_prev + L_next);
  matrix = -epsilon + 2 * epsilon * rand(L_next, L_prev + 1);
  %se initializeaza ponderile conform breviarului
endfunction
