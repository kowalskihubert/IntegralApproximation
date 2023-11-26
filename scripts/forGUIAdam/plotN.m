function [errors_s, errors_t, coeff_indices] = plotN(a, b, coefficients, N)
% PLOTN Zwraca błędy dla różnych N oraz liczby użytych współczynników do rysowania w MATLAB GUI.
%   a, b definiują przedział całkowania.
%   coefficients to tablica współczynników dla wielomianów Czebyszewa.
%   Funkcja zwraca błędy dla reguły Simpsona i reguły trapezów, wraz z coeff_indices.
%
% Wejście:
%   a - dolna granica całkowania
%   b - górna granica całkowania
%   coefficients - tablica współczynników wielomianów Czebyszewa
%   N - maksymalna liczba podprzedziałów do rozważenia
%
% Wyjście:
%   errors_s - macierz błędów dla reguły Simpsona
%   errors_t - macierz błędów dla reguły trapezów
%   coeff_indices - indeksy współczynników użytych w obliczeniach
%
% Przykłady użycia:
%   [errors_s, errors_t, coeff_indices] = plotN(0, 1, coefficients, 10);
%
% Zobacz też INTEGRAL, TRAPEZOIDAL, SIMPSON.

    N_values = 1:N; % Liczba podprzedziałów
    maxCoefficients = length(coefficients); % Całkowita liczba dostarczonych współczynników
    coeff_indices = 1:maxCoefficients; % Uwzględnienie wszystkich współczynników zaczynając od pierwszego
    errors_s = zeros(maxCoefficients, length(N_values)); % Macierz do przechowywania błędów dla reguły Simpsona
    errors_t = zeros(maxCoefficients, length(N_values)); % Macierz do przechowywania błędów dla reguły trapezów

    for j = coeff_indices
        % Użycie pierwszych j współczynników
        currentCoefficients = coefficients(1:j);
        func = @(x) chebyshev_combination(x, currentCoefficients);

        % Obliczenie dokładnej całki
        trueIntegral = integral(func, a, b, 'ArrayValued', true);

        % Pętla dla każdej wartości N do obliczenia całek i ich błędów
        for i = N_values
            % Obliczenie całek trapezowych i Simpsona
            trapezoidalIntegral = trapezoidal(a, b, i, @chebyshev_combination, currentCoefficients);
            simpsonIntegral = simpson(a, b, i, @chebyshev_combination, currentCoefficients);
            
            % Obliczenie błędów względnych
            errors_s(j, i) = abs(trueIntegral - simpsonIntegral) / trueIntegral;
            errors_t(j, i) = abs(trueIntegral - trapezoidalIntegral) / trueIntegral;
        end
    end
end
