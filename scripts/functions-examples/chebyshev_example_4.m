function [w] = chebyshev_example_4(x)
% Przykład nr 4 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 20.
% Wartości całki z tego wielomianu wewnątrz przedziału (-1,1) są relatywnie
% niskie.

a_k = ones(1, 11);
w = chebyshev_combination(a_k, x);

end
