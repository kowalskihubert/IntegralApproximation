function I = simpson(a, b, N, polynomialValue, coefficients)
% SIMPSON Oblicza całkę oznaczoną funkcji wielomianowej metodą Simpsona.
%   I = SIMPSON(a, b, N, polynomialValue, coefficients) wykonuje obliczenia
%   całki oznaczonej dla funkcji wielomianowej w przedziale [a, b] używając
%   metody Simpsona.
%
%   Argumenty:
%       a - początek przedziału całkowania.
%       b - koniec przedziału całkowania.
%       N - liczba równych podprzedziałów, na które dzielony jest przedział
%           całkowania. Musi być liczbą całkowitą większą od 1.
%       polynomialValue - zewnętrzna funkcja, która oblicza wartość funkcji
%                         wielomianowej dla zadanych współczynników i wartości x.
%       coefficients - wektor współczynników funkcji wielomianowej.
%
%   Zwracana wartość:
%       I - przybliżona wartość całki oznaczonej funkcji wielomianowej
%           obliczona metodą Simpsona.

    % Obliczenie szerokości podprzedziału
    H = (b - a) / N;
    
    % Wektoryzacja punktów x dla sumy z mnożnikiem 2 (końce przedziałów)
    x2 = linspace(a + H, b - H, N-1);
    
    % Wektoryzacja punktów x dla sumy z mnożnikiem 4 (środki przedziałów)
    x4 = linspace(a + H/2, b - H/2, N);
    
    % Obliczenia wartości funkcji wielomianowej
    fx_a = polynomialValue(coefficients, a);
    fx_b = polynomialValue(coefficients, b);
    fx2 = polynomialValue(coefficients, x2);
    fx4 = polynomialValue(coefficients, x4);
    
    % Obliczenie przybliżonej wartości całki
    I = H/6 * (fx_a + fx_b + 2*sum(fx2) + 4*sum(fx4));
end
