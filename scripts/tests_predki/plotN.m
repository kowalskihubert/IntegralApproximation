function plotN(a, b, coefficients, T, U)
    %PLOTN Generates a heatmap of errors for varying N and the number of coefficients used.
    %   a, b define the integration interval.
    %   coefficients is an array of coefficients for Chebyshev polynomials.
    %   T and U are cell arrays of Chebyshev polynomials of the first and second kind.

    N_values = 1:10; % Number of subintervals
    maxCoefficients = length(coefficients); % The total number of coefficients provided
    errors = zeros(maxCoefficients, length(N_values)); % Matrix to store errors
    
    % Loop over each subset of coefficients
    for j = 1:maxCoefficients
        % Use the first j coefficients
        currentCoefficients = coefficients(1:j);
        
        % Generate the function for the current subset of coefficients
        func = generateChebyshevCombination(T, U, currentCoefficients);
        
        % Calculate the true integral
        trueIntegral = integral(func, a, b, 'ArrayValued', true);
        
        % Loop over each N value to compute the Simpson integral and its error
        for i = 1:length(N_values)
            % Compute the Simpson integral
            simpsonIntegral = simpson(a, b, N_values(i), @polynomialValue, currentCoefficients);
            
            % Calculate the absolute error
            errors(j, i) = abs(trueIntegral - simpsonIntegral);
        end
    end
    
    % Create the heatmap
    figure;
    h = heatmap(N_values, 1:maxCoefficients, errors);
    colormap(h.Parent, 'jet'); 
    xlabel('N (Number of Subintervals)');
    ylabel('Number of Coefficients Used');
    title('Error Heatmap of Simpson''s Rule Integration');
end
