function [w] = chebyshev_example_9(x)
% Przykład nr 9 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 10.
% Kolejne elementy kombinacji ważone są coraz mniejszymi wagami. Dzięki
% temu na przedziale nawet większym niż [-1,1] wartości całki są relatywnie
% małe.

k = [0 1 2 3 4 5];
a_k = 10.^(-3.*k);
w = chebyshev_combination(a_k, x);

end

