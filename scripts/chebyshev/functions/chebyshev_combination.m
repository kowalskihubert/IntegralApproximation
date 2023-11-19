function [w] = chebyshev_combination(a_k, x)
% Funkcja oblicza wartość w punkcie x funkcji będącej kombinacją
% wielomianów Czebyszewa I i II rodzaju od 0 do n włącznie, a współczynnikach a_k
% WEJŚCIE: 
% n - ilość składników sumy
% a_k - współczynniki sumy
% x - argument funkcji (być może wektor)
% WYJŚCIE:
% y - wartość funkcji w punkcie x (punktach x)

n = length(a_k) - 1;
t0 = 1; % wartość wielomianu T0
u0 = 1; % wartość wielomianu U0

t1 = x; % wartość wielomianu T1 w punkcie x, t2 = 2x*t1 - t0
u1 = 2.*x;  % wartość wielomianu U1 w punkcie x, u2 = 2x*u1 - u0
w = a_k(1) .* t0 .* u0 + a_k(2) .* t1 .* u1;

for k = 2:n
    t = 2 .* x .* t1 - t0; % aktualnie obliczany wielomian T
    t0 = t1; % uaktualnienie t0 i t1
    t1 = t;

    u = 2 .* x .* u1 - u0; % aktualnie obliczany wielomian U
    u0 = u1;
    u1 = u;

    w = w + a_k(k+1) .* t .* u;
end

end

