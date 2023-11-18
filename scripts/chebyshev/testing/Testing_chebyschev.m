% Test metody trapezów na funkcji z wielomianami Czebyszewa:

a = -1;
b = 1;
N = 15;
n = 5;
a_k = [4 2 18 -4 2 0.5];

disp("Przybliżona wartość dla chebyshev_combination:")
s = trapezoidal(a, b, N, @chebyshev_combination, n, a_k)
% Gdy używamy metody trapezoidal(...), nie ma potrzeby definiowania nowej
% funkcji za każdym razem gdy chcemy zmienić wpółczynniki a_k lub wartość n.
% Wystarczy podać zmienione parametry do funkcji trapezoidal().

a = -1;
b = 1;
n = 3;
a_k = [4 2 18 -4];

disp("Przybliżona wartość dla chebyshev_combination skróconego:")
s = trapezoidal(a, b, N, @chebyshev_combination, n, a_k)

N = 50;
disp("Przybliżona wartość dla chebyshev_combination skróconego ze zwiększoną dokładnością:")
s = trapezoidal(a, b, N, @chebyshev_combination, n, a_k)


% Aby sprawdzić poprawność obliczonych całek potrzebujemy funkcji z tylko
% jednym argumentem, aby przekazać ją do integral(...), należy więc
% stworzyć funkcję chebyshev_example_p (dla pewnego p), przy czym można w
% tej funkcji skorzystać z ogólnej chebyshev_combination

a = -2;
b = 10;
s1 = trapezoidal_general(a, b, N, @chebyshev_example_1) % chebyshev_example_1 jest wielomianem stopnia 10
s1_d = integral(@chebyshev_example_1, a, b)
blad_wzgl = abs(s1_d - s1) / abs(s1_d)
