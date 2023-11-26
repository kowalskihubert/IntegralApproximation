function [tableData, columnNames] = testChebyshevTable(tests)
    % Display header
    columnNames = {'Test #', 'True Integral', 'Simpson', 'Simpson Diff', 'Simpson Error (%)', 'Trapezoidal', 'Trapezoidal Diff', 'Trapezoidal Error (%)'};
    tableData = cell(length(tests), length(columnNames));

    % Iterate over each test case and compute the integrals
    for i = 1:length(tests)
        testCase = tests{i};
        a = testCase.a;
        b = testCase.b;
        coefficients = testCase.f;
        N = testCase.N;

        func = @(x) chebyshev_combination(coefficients, x);

        % Compute the "true" integral using MATLAB's integral function
        trueIntegral = integral(func, a, b);
        
        % Compute the Simpson integral using a generic simpson function
        simpsonIntegral = simpson(a, b, N, @chebyshev_combination, coefficients);
        
        % Compute the trapezoidal integral
        trapezoidalIntegral = trapezoidal(a, b, N, @chebyshev_combination, coefficients);

        % Calculate the absolute differences for Simpson
        differenceSimpson = abs(trueIntegral - simpsonIntegral);
        
        % Calculate the absolute differences for Trapezoidal
        differenceTrapezoidal = abs(trueIntegral - trapezoidalIntegral);
        
        % Calculate the relative error percentage for the Simpson method
        relativeErrorSimpson = 100 * differenceSimpson / abs(trueIntegral);
        
        % Calculate the relative error percentage for the Trapezoidal method
        relativeErrorTrapezoidal = 100 * differenceTrapezoidal / abs(trueIntegral);

        % Display the formatted result
        tableData(i,:) = {i, trueIntegral, simpsonIntegral, differenceSimpson, relativeErrorSimpson, trapezoidalIntegral, differenceTrapezoidal, relativeErrorTrapezoidal};
    end
end
