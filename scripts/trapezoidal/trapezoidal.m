function [s] = trapezoidal(a, b, N, f)
% WYJŚCIE: s - liczba rzeczywista, przybliżona wartość całki
% WEJŚCIE:
% a,b - krańce przedziału całkowania
% N - liczba podprzedziałów do złożonej metody trapezów
% f - całkowana funkcja

assert(b > a, "Koniec przedziału (b) musi być większy od początku (a).")
assert(N >= 1, "Liczba przedziałów musi być dodatnia.")

H = (b-a)/N;
k = 1:1:N-1;
x_k = a + k.*H; % węzły kwadratury poza pierwszym i ostatnim

s = H/2 * (f(a) + f(b) + 2 * sum( f(x_k) ) );


end

