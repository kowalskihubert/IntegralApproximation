function simpsonTestChebyshev(tests, T, U)
    % Display header
    fprintf('%-8s %-20s %-20s %-20s %-20s\n', 'Test #', 'True Integral', 'Simpson', 'Simpson Diff', 'Relative Error (%)');
    
    % Iterate over each test case and compute the integrals
    for i = 1:length(tests)
        testCase = tests{i};
        a = testCase.a;
        b = testCase.b;
        coefficients = testCase.f;
        N = testCase.N;
        func = generateChebyshevCombination(T, U, coefficients);

        % Compute the "true" integral using MATLAB's integral function
        trueIntegral = integral(func, a, b);
        
        % Compute the Simpson integral using a generic simpson function
        simpsonIntegral = simpson(coefficients, a, b, N);
        
        % Calculate the absolute differences
        differenceSimpson = abs(trueIntegral - simpsonIntegral);
        
        % Calculate the relative error percentage for the generic method
        relativeErrorSimpson = 100 * differenceSimpson / abs(trueIntegral);

        % Display the formatted result
        fprintf('%-8d %-20.12f %-20.12f %-20.12f %-20.2f\n', i, trueIntegral, simpsonIntegral, differenceSimpson, relativeErrorSimpson);
    end
end
