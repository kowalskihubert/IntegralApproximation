function [errors_s, errors_t, coeff_indices] = plotN(a, b, coefficients, N)
    % PLOTN Returns errors for varying N and the number of coefficients used for plotting in MATLAB GUI.
    %   a, b define the integration interval.
    %   coefficients is an array of coefficients for Chebyshev polynomials.
    %   The function returns errors for Simpson's and Trapezoidal rules, along with coeff_indices.
    
    N_values = 1:N; % Number of subintervals
    maxCoefficients = length(coefficients); % The total number of coefficients provided
    coeff_indices = 1:maxCoefficients; % Include all coefficients starting from the first one
    errors_s = zeros(maxCoefficients, length(N_values)); % Matrix to store errors for Simpson's Rule
    errors_t = zeros(maxCoefficients, length(N_values)); % Matrix to store errors for the Trapezoidal Rule

    for j = coeff_indices
        % Use the first j coefficients
        currentCoefficients = coefficients(1:j);
        func = @(x) chebyshev_combination(x, currentCoefficients);

        % Calculate the true integral
        trueIntegral = integral(func, a, b, 'ArrayValued', true);

        % Loop over each N value to compute the integrals and their errors
        for i = N_values
            % Compute the Trapezoidal and Simpson integrals
            trapezoidalIntegral = trapezoidal(a, b, i, @chebyshev_combination, currentCoefficients);
            simpsonIntegral = simpson(a, b, i, @chebyshev_combination, currentCoefficients);
            
            % Calculate the relative errors
            errors_s(j, i) = abs(trueIntegral - simpsonIntegral) / trueIntegral;
            errors_t(j, i) = abs(trueIntegral - trapezoidalIntegral) / trueIntegral;
        end
    end
end
