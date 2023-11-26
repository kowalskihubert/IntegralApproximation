n = 3;
m = 6;

%testCases = createSimpsonTestChebyshev(n, m);

%testChebyshev(testCases);

coeffs = [1, 2, 3, 4, 5];
N = 50;
[bestN, bestNError] = kaniastyKowalskiError(coeffs, -1, 1, @simpson, N)