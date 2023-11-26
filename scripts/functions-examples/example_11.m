function [w] = example_11(x)
% Przykład nr 11 funkcji w = w(x) będącej kombinacją wielomianów Czebyszewa 
% dla ustalonych współczynników a_k. Ten wielomian w(x) jest stopnia 4.
% Ten wielomian jest postaci sumy od k = 0 do n z wyrażeń ak* Tk(x). Jest
% to zatem kombinacja ale tylko wielomianów Czebyszewa I rodzaju.

a_k = [1 1 1 1 1];

n = length(a_k) - 1;

t0 = 1; % wartość wielomianu T0

t1 = x; % wartość wielomianu T1 w punkcie x, t2 = 2x*t1 - t0

w = a_k(1) .* t0 + a_k(2) .* t1;

for k = 2:n

    t = 2 .* x .* t1 - t0; % aktualnie obliczany wielomian T
    t0 = t1; % uaktualnienie t0 i t1
    t1 = t;

    w = w + a_k(k+1) .* t;
end

end


