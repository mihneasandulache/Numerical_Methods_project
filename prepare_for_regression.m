function FeatureMatrix = prepare_for_regression(InitialMatrix)
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);

  k = -1;
  for i = 1:m
    for j = 1:n
      if strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, j) = 0;
      elseif strcmp(InitialMatrix{i, j}, 'yes')
        FeatureMatrix(i, j) = 1;
      elseif isnumeric(InitialMatrix{i, j})
        FeatureMatrix(i, j) = InitialMatrix{i, j};
        %se transforma toate sirurile de "yes" si "no"
      endif
      if k == -1 && (strcmp(InitialMatrix{i, j}, 'unfurnished') || ...
                    strcmp(InitialMatrix{i, j}, 'furnished') || ...
                    strcmp(InitialMatrix{i, j}, 'semi-furnished'))
        k = j;
        %retinem coloana care contine sirurile ce indica stadiul de
        %mobilare al camerelor
      endif
    endfor
  endfor

  for i = 1:m
    for j = n + 1:-1:k
      FeatureMatrix(i, j) = FeatureMatrix(i, j - 1);
    endfor
  endfor
  %pornind de la coloana aflata anterior, mutam toate coloanele la dreapta
  %cu o pozitie pentru a putea transforma sirurile ramase
  for i = 1:m
    if strcmp(InitialMatrix{i, k}, 'furnished')
      FeatureMatrix(i, k) = 0;
      FeatureMatrix(i, k + 1) = 0;
    elseif strcmp(InitialMatrix{i, k}, 'unfurnished')
      FeatureMatrix(i, k) = 0;
      FeatureMatrix(i, k + 1) = 1;
    elseif strcmp(InitialMatrix{i, k}, 'semi-furnished')
      FeatureMatrix(i, k) = 1;
      FeatureMatrix(i, k + 1) = 0;
      %se transforma sirurile ramase
    endif
  endfor
endfunction
