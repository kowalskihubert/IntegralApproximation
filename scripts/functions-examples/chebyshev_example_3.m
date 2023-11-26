function [w] = chebyshev_example_3(x)
% Przykład nr 3 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 20.
% Wartości całki z tego wielomianu na przedziale większym niż (-1,1) są
% bardzo duże i szybko rosną.

a_k = ones(1, 11);
w = chebyshev_combination(a_k, x);

end

