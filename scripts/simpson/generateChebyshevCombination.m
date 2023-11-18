function wn = generateChebyshevCombination(T, U, coefficients)
    % T - cell array of Chebyshev polynomials of the first kind
    % U - cell array of Chebyshev polynomials of the second kind
    % coefficients - array of coefficients a_k
    wn = @(x) 0;
    for k = 0:size(coefficients,1)
        wn = @(x) wn(x) + coefficients(k+1) .* T{k+1}(x) .* U{k+1}(x);
    end
end