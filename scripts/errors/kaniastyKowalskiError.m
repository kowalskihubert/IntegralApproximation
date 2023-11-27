function [bestN, bestNError] = kaniastyKowalskiError(coefficients, a, b, method, maxN)
%KANIASTYKOWALSKIERROR Znajduje optymalną liczbę przedziałów N dla numerycznej całki.
% Funkcja oblicza optymalną liczbę przedziałów N, która minimalizuje błąd całkowania
% numerycznego przy jednoczesnym uwzględnieniu kosztu obliczeniowego. Kara za 
% zwiększenie liczby przedziałów rośnie kwadratowo z N.
%
% Syntax:
% [bestN, bestNError] = kaniastyKowalskiError(coefficients, a, b, method, maxN)
%
% Wejście:
% coefficients - Współczynniki dla kombinacji wielomianów Czebyszewa
% a, b - Granice całkowania
% method - Funkcja metody numerycznej całkowania do użycia
% maxN - Maksymalna liczba przedziałów do rozważenia
%
% Wyjście:
% bestN - Najlepsza liczba przedziałów N minimalizująca łączny błąd i karę
% bestNError - Wartość łącznego błędu dla optymalnej liczby przedziałów N

   func = @(x) chebyshev_combination(coefficients, x); % Definicja funkcji pod całką
   trueIntegral = integral(func, a, b, 'ArrayValued', true); % Obliczanie dokładnej wartości całki
   
   errors = zeros(1, maxN); % Inicjalizacja wektora błędów
   for N = 1:maxN % Pętla obliczająca błąd dla każdej liczby przedziałów
       approxIntegral = method(a, b, N, @chebyshev_combination, coefficients); % Obliczanie przybliżonej całki
       unpenalizedError = abs(trueIntegral - approxIntegral) / trueIntegral; % Obliczanie błędu bez kary
       penalty = log(1+N); % Obliczanie kary kwadratowej
       errors(N) = unpenalizedError + penalty; % Sumowanie błędu i kary
   end

   [bestNError, bestN] = min(errors); % Wybór optymalnej liczby przedziałów
   
   plot(1:maxN, errors, "-o"); % Rysowanie wykresu błędów
   xlabel('Liczba przedziałów N'); % Opis osi X
   ylabel('Łączny błąd całkowania i kara'); % Opis osi Y
   title('Zależność błędu całkowania od liczby przedziałów N');
end
