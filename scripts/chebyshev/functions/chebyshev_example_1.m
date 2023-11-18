function [w] = chebyshev_example_1(x)
% Przykład funkcji wn(x) dla ustalonego n oraz ustalonych współczynników
% a_k

n = 5;
a_k = [4 2 18 -4 2 0.5];
w = chebyshev_combination(n, a_k, x);


end

