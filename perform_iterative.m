function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  x = x0;
  steps = 0;
  eigenvalue = eigs(G, 1, 'lm');
  if eigenvalue - 1 >= tol
      return
  endif
  %in cazul in care matricea nu converge se paraseste functia

  while steps < max_steps
    steps++;
    x_new = G * x + c;
    err = norm(x_new - x);
    if err <= tol
      break;
    endif
    x = x_new;

  endwhile
  %se aplica algoritmul iterativ Jacobi conform breviarului din enunt
endfunction


