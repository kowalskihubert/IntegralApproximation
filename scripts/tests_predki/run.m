n = 12;
m = 6;
[T, U] = generateChebyshevPolynomials(n);

testCases  = createSimpsonTestChebyshev(n, m);
testChebyshev(testCases, T, U);

a_k = ones(1, 10) .* 2;
plotN(-1, 1, a_k, T, U)