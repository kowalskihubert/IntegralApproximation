%{
function I = simpson(coefficients, a, b, N)
    h = (b - a) / N;
    I = 0;
    for k = 1:N
        xLeft = a + (k-1) * h;
        xRight = a + k * h;
        I = I + simpsonSimplified(coefficients, xLeft, xRight);
    end
end
%}

function I = simpson(coefficients, a, b, N)
    % coefficients - wektor współczynników wielomianu
    % a - dolna granica całkowania
    % b - górna granica całkowania
    % N - liczba podprzedziałów (powinna być parzysta)

    H = (b - a) / N; % Obliczenie szerokości podprzedziału

    % Inicjalizacja wartości całki
    I = polynomialValue(coefficients, a) + polynomialValue(coefficients, b);

    % Obliczenie sumy dla parzystych indeksów (4*f(a + kH + H/2))
    for k = 0:N-1
        I = I + 4 * polynomialValue(coefficients, a + k*H + H/2);
    end

    % Obliczenie sumy dla nieparzystych indeksów (2*f(a + kH))
    % Pomijamy pierwszy i ostatni punkt, bo już zostały dodane
    for k = 1:N-1
        I = I + 2 * polynomialValue(coefficients, a + k*H);
    end

    % Zakończenie obliczenia całki
    I = I * (H / 6);
end


function y = polynomialValue(coefficients, x)
    N = length(coefficients) - 1; % Stopień wielomianu
    T = zeros(N+1, length(x)); % Tablica do przechowywania wartości T_k(x)
    U = zeros(N+1, length(x)); % Tablica do przechowywania wartości U_k(x)
    
    % Inicjalizacja pierwszych dwóch wartości wielomianów Czebyszewa
    T(1,:) = 1; % T_0(x) = 1
    T(2,:) = x; % T_1(x) = x
    U(1,:) = 1; % U_0(x) = 1
    U(2,:) = 2*x; % U_1(x) = 2x
    
    % Obliczanie wartości wielomianów Czebyszewa rekurencyjnie
    for k = 2:N
        T(k+1,:) = 2 .* x .* T(k,:) - T(k-1,:);
        U(k+1,:) = 2 .* x .* U(k,:) - U(k-1,:);
    end
    
    % Obliczanie wartości wielomianu z użyciem wektoryzacji
    y = sum((coefficients.' .* T) .* U, 1);
end
