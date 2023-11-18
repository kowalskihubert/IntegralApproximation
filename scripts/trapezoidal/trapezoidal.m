function [s] = trapezoidal(a, b, N, f, n, a_k)
% Funkcja przybliżająca całkę z funkcji f, przy czym f jest postaci
% kombinacji wielomianów Czebyszewa od 0 do n włącznie, ze współczynnikami
% a_k
% WYJŚCIE: 
% s - liczba rzeczywista, przybliżona wartość całki
% WEJŚCIE:
% a,b - krańce przedziału całkowania
% N - liczba podprzedziałów do złożonej metody trapezów
% f - całkowana funkcja
% n - liczba składników sumy
% a_k - wekotr współczynników sumy, długości n+1

assert(b > a, "Koniec przedziału (b) musi być większy od początku (a).")
assert(N >= 1, "Liczba przedziałów musi być dodatnia.")

H = (b-a)/N;
k = 1:1:N-1;
x_k = a + k.*H; % węzły kwadratury poza pierwszym i ostatnim

s = H/2 * (f(n, a_k, a) + f(n, a_k, b) + 2 * sum( f(n, a_k, x_k) ) );


end

