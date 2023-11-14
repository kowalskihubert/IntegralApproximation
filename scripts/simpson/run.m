n = 15;
m = 6;
[U, T] = generateChebyshevPolynomials(n);

testCases  = createSimpsonTest(n, m);
simpsonTest(testCases, T, U);