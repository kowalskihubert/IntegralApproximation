function tests = createSimpsonTestChebyshev(n, m)
    % Define a cell array of test case structures with Chebyshev polynomials
    tests = cell(m, 1);
    for i = 1:m
        coefficients = randi([0, 10], 1, n);
        newTest = struct(...
            'a', -1,...
            'b', 10,...
            'N', 100000,...
            'f', coefficients);
        tests{i} = newTest;
    end
end