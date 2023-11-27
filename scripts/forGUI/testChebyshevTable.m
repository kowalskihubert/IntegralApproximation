function [tableData, columnNames] = testChebyshevTable(tests)
% TESTCHEBYSHEVTABLE Tworzy tabelę wyników całkowania dla zestawu testów.
%   Funkcja oblicza całki numeryczne za pomocą metody Simpsona i trapezów,
%   porównuje je z dokładnymi wartościami całki i prezentuje błędy bezwzględne
%   oraz procentowe dla różnych wartości N i współczynników wielomianów 
%   Czebyszewa.
%
%   Wejście:
%       tests - komórka zawierająca struktury testów z polami:
%           a - dolna granica całkowania,
%           b - górna granica całkowania,
%           f - współczynniki funkcji Chebyshev,
%           N - liczba podprzedziałów użyta w metodach numerycznych.
%
%   Wyjście:
%       tableData - dane tabeli zawierające wyniki testów,
%       columnNames - nazwy kolumn tabeli.
%
%   Użycie:
%       [daneTabeli, nazwyKolumn] = testChebyshevTable({struct('a', 0, 'b', 1, 'f', [1,2,3], 'N', 10), ...});
%       gdzie "..." oznacza dalsze struktury testowe.
%
%   Zobacz też INTEGRAL, SIMPSON, TRAPEZOIDAL.

    % Inicjalizacja nazw kolumn
    columnNames = {'Test #', 'True Integral', 'Simpson', 'Simpson Diff', 'Simpson Error (%)', 'Trapezoidal', 'Trapezoidal Diff', 'Trapezoidal Error (%)'};
    % Inicjalizacja danych tabeli
    tableData = cell(length(tests), length(columnNames));

    % Iteracja przez każdy przypadek testowy i obliczanie całek
    for i = 1:length(tests)
        testCase = tests{i};
        a = testCase.a;
        b = testCase.b;
        coefficients = testCase.f;
        N = testCase.N;

        % Definicja funkcji pod całką
        func = @(x) chebyshev_combination(coefficients, x);

        % Obliczanie dokładnej całki za pomocą funkcji integral MATLAB-a
        trueIntegral = integral(func, a, b);
        
        % Obliczanie całki metodą Simpsona
        simpsonIntegral = simpson(a, b, N, @chebyshev_combination, coefficients);
        
        % Obliczanie całki metodą trapezów
        trapezoidalIntegral = trapezoidal(a, b, N, @chebyshev_combination, coefficients);

        % Obliczanie błędów bezwzględnych dla metody Simpsona
        differenceSimpson = abs(trueIntegral - simpsonIntegral);
        
        % Obliczanie błędów bezwzględnych dla metody trapezoidalnej
        differenceTrapezoidal = abs(trueIntegral - trapezoidalIntegral);
        
        % Obliczanie błędów względnych procentowo dla metody Simpsona
        relativeErrorSimpson = 100 * differenceSimpson / abs(trueIntegral);
        
        % Obliczanie błędów względnych procentowo dla metody trapezoidalnej
        relativeErrorTrapezoidal = 100 * differenceTrapezoidal / abs(trueIntegral);

        % Kompletowanie danych do tabeli
        tableData(i,:) = {i, trueIntegral, simpsonIntegral, differenceSimpson, relativeErrorSimpson, trapezoidalIntegral, differenceTrapezoidal, relativeErrorTrapezoidal};
    end
end
