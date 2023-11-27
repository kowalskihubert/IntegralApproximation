n = 3;
m = 6;

%testCases = createSimpsonTestChebyshev(n, m);

%testChebyshev(testCases);

coeffs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
N = 50;
[bestN, bestNError] = kaniastyKowalskiError(coeffs, -10, 10, @simpson, N)