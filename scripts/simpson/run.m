n = 3;
m = 6;
[T, U] = generateChebyshevPolynomials(n);

testCases  = createSimpsonTest(n, m);
simpsonTest(testCases, T, U);