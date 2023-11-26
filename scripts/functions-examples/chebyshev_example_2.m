function [w] = chebyshev_example_2(x)
% Przykład nr 2 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 0.
% Metoda trapezów powinna obliczać dokładną wartość całki z funkcji stałej.

a_k = 15;
w = chebyshev_combination(a_k, x);

end

