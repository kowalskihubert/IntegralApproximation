function I = simpsonSimplified(coefficients, a, b)
    % Chebyshev polynomials of the first and second kinds
    n = numel(coefficients);
    % Calculate w_n(x) using the Chebyshev polynomials and coefficients from function f
    function w = value(coefficients, n, x)
        T = 1;
        U = 1;
        w = coefficients(1) * T * U;
        if n > 1
            T_next = x;
            U_next = 2 * x;
            w = w + coefficients(2) * T_next * U_next;
            for k = 2:(n-1)
                T_temp = T;
                T = T_next;
                T_next = 2 * x * T - T_temp; 

                U_temp = U;
                U = U_next;
                U_next = 2 * x * U - U_temp;
                
                w = w + coefficients(k + 1) * T_next * U_next;
            end
        end
    end
    
    % Calculate the values of w_n(x) at the points a, midpoint, and b
    fa = value(coefficients, n, a);
    fm = value(coefficients, n, (a + b) / 2);
    fb = value(coefficients, n, b);

    % Calculate the approximate value of the integral
    I = ((b - a) / 6) * (fa + 4 * fm + fb);
end
