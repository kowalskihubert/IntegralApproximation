function [w] = chebyshev_example_8(x)
% Przykład nr 8 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 10.
% Wszystkie współczynniki równe są 10^(-8). Nie pomaga to uniknąć dużych
% wartości wielomianu poza przedziałem [-1,1], natomiast wewnątrz tego
% przedziału wartość całki jest bliska 0;

k = 10^(-8);
a_k = [k k k k k k];
w = chebyshev_combination(a_k, x);

end

