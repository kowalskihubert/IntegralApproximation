function [T, U] = generateChebyshevPolynomials(n)
    % Inicjalizacja pierwszych dwóch wielomianów Tn i Un
    T = cell(n+1, 1);
    U = cell(n+1, 1);
    
    T{1} = @(x) 1;  % T0(x) = 1
    T{2} = @(x) x;              % T1(x) = x

    U{1} = @(x) 1;  % U0(x) = 1
    U{2} = @(x) 2*x;            % U1(x) = 2x
    
    % Rekurencyjne generowanie pozostałych wielomianów
    for k = 2:n
        T{k+1} = @(x) 2 .* x .* T{k}(x) - T{k-1}(x);
        U{k+1} = @(x) 2 .* x .* U{k}(x) - U{k-1}(x);
    end
end