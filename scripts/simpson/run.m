n = 3;
m = 20;
[T, U] = generateChebyshevPolynomials(n);

testCases  = createSimpsonTestChebyshev(n, m);
simpsonTestChebyshev(testCases, T, U);