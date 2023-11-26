function [w] = chebyshev_example_1(x)
% Przykład nr 13 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 2.
% Metoda Simpsona powinna obliczać dokładną wartość całki z tego wielomianu.

a_k = [4 2];
w = chebyshev_combination(a_k, x);

end
