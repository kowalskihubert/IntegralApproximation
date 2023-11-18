function I = simpson(a, b, N, polynomialValue, coefficients)
%SIMPSON Oblicza całkę funkcji wielomianowej metodą Simpsona.
%   Funkcja SIMPSON przyjmuje granice całkowania a i b, liczbę podprzedziałów N,
%   wskaźnik do funkcji obliczającej wartość wielomianu 'polynomialValue'
%   oraz wektor współczynników wielomianu 'coefficients'. Zwraca przybliżoną wartość
%   całki oznaczonej funkcji wielomianowej na przedziale [a, b] używając metody Simpsona.
%
%   Argumenty:
%       a             - Dolna granica całkowania.
%       b             - Górna granica całkowania.
%       N             - Liczba równych podprzedziałów, na które dzielony jest przedział [a, b].
%       polynomialValue - Uchwyt do funkcji, która oblicza wartość wielomianu
%                         w danym punkcie.
%       coefficients    - Wektor współczynników wielomianu, z których każdy 
%                         odpowiada kolejnemu stopniowi wielomianu.
%
%   Wyjście:
%       I             - Przybliżona wartość całki oznaczonej funkcji wielomianowej
%                         na przedziale [a, b].
%
%   Przykład użycia:
%       coeff = [1, 0, -1];
%       a = 0;  % Dolna granica całkowania
%       b = 1;  % Górna granica całkowania
%       N = 10; % Liczba podprzedziałów
%       I = simpson(a, b, N, @polynomialValue, coeff);  % Obliczenie całki
%

    % Obliczenie szerokości podprzedziału
    H = (b - a) / N;
    % Inicjalizacja wartości całki
    I = polynomialValue(coefficients, a) + polynomialValue(coefficients, b);

    % Obliczenie pierwszej części sumy
    for k = 0:N-1
        I = I + 4 * polynomialValue(coefficients, a + k*H + H/2);
    end

    % Obliczenie drugiej części sumy
    for k = 1:N-1
        I = I + 2 * polynomialValue(coefficients, a + k*H);
    end

    % Zakończenie obliczenia całki
    I = I * (H / 6);
end
