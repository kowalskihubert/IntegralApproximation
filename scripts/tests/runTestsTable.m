% Skrypt testujący
% Skrypt generuje tabelę zawierającą prawdziwe wartości całki oraz całki
% wyznaczone numerycznie za pomocą metody Simpsona i trapezów dla 12
% przykładowych funkcji.

examples = cell(12,1);

examples{1} = struct('a', -2, 'b', 10, 'N', 50, 'Func', @chebyshev_example_1);
examples{2} = struct('a', -2, 'b', 10, 'N', 50, 'Func', @chebyshev_example_2);
examples{3} = struct('a', 1, 'b', 3, 'N', 50, 'Func', @chebyshev_example_3);
examples{4} = struct('a', -0.5, 'b', 0.5, 'N', 50, 'Func', @chebyshev_example_4);
examples{5} = struct('a', -1, 'b', 1, 'N', 5, 'Func', @chebyshev_example_5);
examples{6} = struct('a', -1, 'b', 1, 'N', 50, 'Func', @chebyshev_example_5);
examples{7} = struct('a', -1.5, 'b', -1, 'N', 50, 'Func', @chebyshev_example_7);
examples{8} = struct('a', -1, 'b', 1, 'N', 50, 'Func', @chebyshev_example_8);
examples{9} = struct('a', -5, 'b', 5, 'N', 50, 'Func', @chebyshev_example_9);
examples{10} = struct('a', -0.7, 'b', 0, 'N', 50, 'Func', @chebyshev_example_10); 
examples{11} = struct('a', -1, 'b', -0.5, 'N', 50, 'Func', @example_11);
examples{12} = struct('a', -10, 'b', 10, 'N', 100, 'Func', @example_12);


disp('Test #   a        b        N      Trapezoidal       Integral         Trap Error      Simpson          Simp Error');

for i = 1:length(examples)
    a = examples{i}.a;
    b = examples{i}.b;
    N = examples{i}.N;
    func = examples{i}.Func;
    
    trapezoidal_result = round(trapezoidal_general(a, b, N, func), 8);
    
    simpson_result = round(simpson_general(a, b, N, func), 8);
    
    integral_result = integral(func, a, b);
    

    trap_relative_error = abs(integral_result - trapezoidal_result) / abs(integral_result);
    simp_relative_error = abs(integral_result - simpson_result) / abs(integral_result);
    
    fprintf('%-8d %-8.2f %-8.2f %-6d %-20.8f %-20.8f %-20.8f %-20.8f %-20.8f\n', ...
        i, a, b, N, trapezoidal_result, integral_result, trap_relative_error, simpson_result, simp_relative_error);
end

