function wn = generateChebyshevCombination(T, U, coefficients)
%GENERATECHEBYSHEVCOMBINATION Generuje funkcję będącą kombinacją wielomianów Czebyszewa.
%   Funkcja GENERATECHEBYSHEVCOMBINATION tworzy kombinację liniową wielomianów
%   Czebyszewa pierwszego i drugiego rodzaju. Każdy wielomian jest przemnożony
%   przez odpowiadający mu współczynnik z wektora coefficients.
%
%   Argumenty:
%       T - komórka zawierająca funkcje reprezentujące wielomiany Czebyszewa
%           pierwszego rodzaju T_n(x), gdzie n to indeks komórki.
%       U - komórka zawierająca funkcje reprezentujące wielomiany Czebyszewa
%           drugiego rodzaju U_n(x), gdzie n to indeks komórki.
%       coefficients - wektor współczynników a_k, gdzie każdy współczynnik
%                      przemnaża odpowiadające mu wielomiany T_n(x) i U_n(x).
%
%   Wyjście:
%       wn - uchwyt do funkcji anonimowej reprezentującej kombinację wielomianów
%            Czebyszewa zgodnie z podanymi współczynnikami.
%
%   Przykład użycia:
%       T = {@(x) 1, @(x) x, @(x) 2*x^2 - 1}; % Przykładowe wielomiany Czebyszewa T
%       U = {@(x) 1, @(x) 2*x, @(x) 4*x^2 - 1}; % Przykładowe wielomiany Czebyszewa U
%       coefficients = [1, -0.5, 0.25]; % Współczynniki dla kombinacji
%       wn = generateChebyshevCombination(T, U, coefficients);
%       % Teraz wn(x) jest gotową funkcją do obliczeń, np. wn(0.5)

    wn = @(x) 0;
    
    for k = 1:(size(coefficients, 2))
        wn = @(x) wn(x) + coefficients(k) .* T{k}(x) .* U{k}(x);
    end
end
