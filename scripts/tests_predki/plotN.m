function plotN(a, b, coefficients, T, U)
    % PLOTN Generates two heatmaps of errors for varying N and the number of coefficients used.
    % One heatmap is for Simpson's Rule and the other is for the Trapezoidal Rule.
    %   a, b define the integration interval.
    %   coefficients is an array of coefficients for Chebyshev polynomials.
    %   T and U are cell arrays of Chebyshev polynomials of the first and second kind.

    N_values = 1:10; % Number of subintervals
    maxCoefficients = length(coefficients); % The total number of coefficients provided
    errors_s = zeros(maxCoefficients - 1, length(N_values)); % Matrix to store errors for Simpson's Rule
    errors_t = zeros(maxCoefficients - 1, length(N_values)); % Matrix to store errors for the Trapezoidal Rule

    % Loop over each subset of coefficients, starting from the second coefficient
    for j = 2:maxCoefficients
        % Use the first j coefficients
        currentCoefficients = coefficients(1:j);
        
        % Generate the function for the current subset of coefficients
        func = generateChebyshevCombination(T, U, currentCoefficients);
        
        % Calculate the true integral
        trueIntegral = integral(func, a, b, 'ArrayValued', true);
        
        % Loop over each N value to compute the integrals and their errors
        for i = 1:length(N_values)
            % Compute the Trapezoidal and Simpson integrals
            trapezoidalIntegral = trapezoidal(a, b, N_values(i), @chebyshev_combination, currentCoefficients);
            simpsonIntegral = simpson(a, b, N_values(i), @chebyshev_combination, currentCoefficients);
            
            % Calculate the absolute errors
            errors_s(j - 1, i) = abs(trueIntegral - simpsonIntegral)/trueIntegral;
            errors_t(j - 1, i) = abs(trueIntegral - trapezoidalIntegral)/trueIntegral;
        end
    end
    
    % Create the figure for the heatmaps
    figure;
    
    % Create the heatmap for Simpson's Rule errors
    subplot(1, 2, 1); % This specifies a 1x2 grid, and activates the first element for the upcoming plot
    h_s = heatmap(N_values, 2:maxCoefficients, errors_s);
    colormap(h_s.Parent, 'jet'); 
    xlabel('N (Number of Subintervals)');
    ylabel('Number of Coefficients Used');
    title('Error Heatmap for Simpson''s Rule Integration');
    
    % Create the heatmap for Trapezoidal Rule errors
    subplot(1, 2, 2); % This activates the second element of the 1x2 grid for the upcoming plot
    h_t = heatmap(N_values, 2:maxCoefficients, errors_t);
    colormap(h_t.Parent, 'jet'); 
    xlabel('N (Number of Subintervals)');
    ylabel('Number of Coefficients Used');
    title('Error Heatmap for Trapezoidal Rule Integration');
end
