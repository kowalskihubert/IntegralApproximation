function y = polynomialValue(coefficients, x)
%POLYNOMIALVALUE Oblicza wartość wielomianu w punkcie x.
%   Funkcja POLYNOMIALVALUE przyjmuje wektor współczynników wielomianu
%   oraz wartość zmiennej x i oblicza wartość wielomianu w punkcie x,
%   wykorzystując rekurencyjną zależność wielomianów Czebyszewa pierwszego i drugiego rodzaju.
%
%   Argumenty:
%       coefficients - Wektor współczynników wielomianu, w kolejności od 
%                      współczynnika przy najwyższym stopniu do współczynnika 
%                      wolnego. Długość wektora minus jeden określa stopień wielomianu.
%       x            - Punkt, w którym ma być obliczona wartość wielomianu.
%
%   Wyjście:
%       y            - Wartość wielomianu w punkcie x.
%
%   Przykład użycia:
%       c = [1, -3, 2];  % Współczynniki wielomianu x^2 - 3x + 2
%       x = 5;           % Punkt, w którym obliczamy wartość
%       y = polynomialValue(c, x);  % y = 12

    % Inicjalizacja stopnia wielomianu i tablic do przechowywania wartości 
    % wielomianów Czebyszewa
    N = length(coefficients) - 1;
    T = zeros(N+1, 1);
    U = zeros(N+1, 1);

    % Ustawienie pierwszych dwóch wartości wielomianów Czebyszewa
    T(1,:) = 1;
    T(2,:) = x;
    U(1,:) = 1;
    U(2,:) = 2*x;

    % Obliczanie wartości wielomianów Czebyszewa rekurencyjnie
    for k = 2:N
        T(k+1,:) = 2 .* x .* T(k,:) - T(k-1,:);
        U(k+1,:) = 2 .* x .* U(k,:) - U(k-1,:);
    end

    % Obliczanie wartości wielomianu
    y = sum((coefficients.' .* T) .* U, 1);
end
