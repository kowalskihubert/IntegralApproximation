function [w] = chebyshev_example_5(x)
% Przykład nr 5 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 6.
% Wartość całki z tego wielomianu na przedziale [-1,1] dla dużej liczby
% podprzedziałów N są dokładniejsze niż dla mniejszego N.

a_k = [0.2916    0.1978    1.5877   -0.8045];
w = chebyshev_combination(a_k, x);

end

