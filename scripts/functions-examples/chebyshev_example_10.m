function [w] = chebyshev_example_10(x)
% Przykład nr 10 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 10.
% Wartość całki na przedziale [-a,0] jest taka sama jak na [0,a]

a_k = [1 2 3 4 5 6];
w = chebyshev_combination(a_k, x);

end

