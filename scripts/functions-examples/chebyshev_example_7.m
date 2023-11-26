function [w] = chebyshev_example_7(x)
% Przykład nr 7 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 10.
% Przykład pokazuje, że poza przedziałem [-1,1] wartości wielomianu
% decyduje wyłącznie ostatni składnik sumy postaci ak*Un(x)*Tn(x)
% (współczynnik przy najwyższej potędze)

a_k = [1 1 1 1 1 -1];
w = chebyshev_combination(a_k, x);

end
