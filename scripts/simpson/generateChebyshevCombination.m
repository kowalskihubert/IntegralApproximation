function wn = generateChebyshevCombination(T, U, coefficients)
    % T - cell array of Chebyshev polynomials of the first kind
    % U - cell array of Chebyshev polynomials of the second kind
    % coefficients - array of coefficients a_k

    % Generate the function wn(x)
    wn = @(x) 0; % Initialize the function handle
    for k = 0:size(coefficients,1)
        % Add the next term of the sum to wn(x)
        % Note the use of element-wise multiplication with .*
        wn = @(x) wn(x) + coefficients(k+1) .* T{k+1}(x) .* U{k+1}(x);
    end
end