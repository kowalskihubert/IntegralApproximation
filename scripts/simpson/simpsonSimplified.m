function I = simpsonSimplified(f, a, b)
    % Chebyshev polynomials of the first and second kinds
    function T = ChebyshevT(k, x)
        if k == 0
            T = 1;
        elseif k == 1
            T = x;
        else
            T = 2 * x * ChebyshevT(k - 1, x) - ChebyshevT(k - 2, x);
        end
    end

    function U = ChebyshevU(k, x)
        if k == 0
            U = 1;
        elseif k == 1
            U = 2 * x;
        else
            U = 2 * x * ChebyshevU(k - 1, x) - ChebyshevU(k - 2, x);
        end
    end

    n = size(f,2);
    % Calculate w_n(x) using the Chebyshev polynomials and coefficients from function f
    function w = value(f, n, x)
        w = 0;
        for k = 1:n
            w = w + f(k) * ChebyshevT(k, x) * ChebyshevU(k, x);
        end
    end
    
    % Calculate the values of w_n(x) at the points a, midpoint, and b
    fa = value(f, n, a);
    fm = value(f, n, (a + b) / 2);
    fb = value(f, n, b);
    
    % Calculate the approximate value of the integral
    I = ((b - a) / 6) * (fa + 4 * fm + fb);
end
