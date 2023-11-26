function testChebyshev(tests)
% TESTCHEBYSHEV Wyświetla tabelę z wynikami całkowania dla zestawu testów.
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
%       Funkcja nie zwraca wartości bezpośrednio, wyniki są wyświetlane
%       na standardowe wyjście w formie tabeli.
%
%   Użycie:
%       testChebyshev({struct('a', 0, 'b', 1, 'f', [1,2,3], 'N', 10), ...});
%       gdzie "..." oznacza dalsze struktury testowe.
%
%   Przykład wyjścia:
%       Test #   True Integral       Simpson             Simpson Diff         Simpson Error (%)   Trapezoidal         Trapezoidal Diff    Trapezoidal Error (%)
%
%   Zobacz też INTEGRAL, SIMPSON, TRAPEZOIDAL.

    % Wyświetlanie nagłówka tabeli
    fprintf('%-8s %-20s %-20s %-20s %-20s %-20s %-20s %-20s\n', 'Test #', 'True Integral', 'Simpson', 'Simpson Diff', 'Simpson Error (%)', 'Trapezoidal', 'Trapezoidal Diff', 'Trapezoidal Error (%)');
    
    % Iteracja przez każdy przypadek testowy i obliczanie całek
    for i = 1:length(tests)
        testCase = tests{i};
        a = testCase.a;
        b = testCase.b;
        coefficients = testCase.f;
        N = testCase.N;
        
        func = @(x) chebyshev_combination(coefficients, x);
        % Obliczanie "prawdziwej" całki przy użyciu funkcji integral MATLAB-a
        trueIntegral = integral(func, a, b, 'ArrayValued', true);
        
        % Obliczanie całki metodą Simpsona przy użyciu generycznej funkcji simpson
        simpsonIntegral = simpson(a, b, N, @chebyshev_combination, coefficients);
        
        % Obliczanie całki metodą trapezów
        trapezoidalIntegral = trapezoidal(a, b, N, @chebyshev_combination, coefficients);

        % Obliczanie absolutnych różnic dla metody Simpsona
        differenceSimpson = abs(trueIntegral - simpsonIntegral);
        
        % Obliczanie absolutnych różnic dla metody trapezoidalnej
        differenceTrapezoidal = abs(trueIntegral - trapezoidalIntegral);
        
        % Obliczanie procentowego błędu względnego dla metody Simpsona
        relativeErrorSimpson = 100 * differenceSimpson / abs(trueIntegral);
        
        % Obliczanie procentowego błędu względnego dla metody trapezoidalnej
        relativeErrorTrapezoidal = 100 * differenceTrapezoidal / abs(trueIntegral);

        % Wyświetlanie sformatowanego wyniku
        fprintf('%-8d %-20.12f %-20.12f %-20.12f %-20.2f %-20.12f %-20.12f %-20.2f\n', i, trueIntegral, simpsonIntegral, differenceSimpson, relativeErrorSimpson, trapezoidalIntegral, differenceTrapezoidal, relativeErrorTrapezoidal);
    end
end
