function [results, columnNames] = Testing_chebyshev_gui()
    examples = cell(12,1);
    
    % Define each example with a structure
    examples{1} = struct('a', -2, 'b', 10, 'N', 50, 'Func', @chebyshev_example_1);
    examples{2} = struct('a', -2, 'b', 10, 'N', 50, 'Func', @chebyshev_example_2);
    examples{3} = struct('a', 1, 'b', 3, 'N', 50, 'Func', @chebyshev_example_3);
    examples{4} = struct('a', -0.5, 'b', 0.5, 'N', 50, 'Func', @chebyshev_example_4);
    examples{5} = struct('a', -1, 'b', 1, 'N', 5, 'Func', @chebyshev_example_5);  % Small N
    examples{6} = struct('a', -1, 'b', 1, 'N', 50, 'Func', @chebyshev_example_5); % Large N
    examples{7} = struct('a', -1.5, 'b', -1, 'N', 50, 'Func', @chebyshev_example_7);
    examples{8} = struct('a', -1, 'b', 1, 'N', 50, 'Func', @chebyshev_example_8);
    examples{9} = struct('a', -5, 'b', 5, 'N', 50, 'Func', @chebyshev_example_9);
    examples{10} = struct('a', -0.7, 'b', 0, 'N', 50, 'Func', @chebyshev_example_10); % First half interval
    examples{11} = struct('a', -1, 'b', -0.5, 'N', 50, 'Func', @example_11); % Different combination
    examples{12} = struct('a', -10, 'b', 10, 'N', 100, 'Func', @example_12);
    
    
    % Loop through the examples and perform the calculations, then print the results
    columnNames = {'Test #', 'a', 'b', 'N', 'Integral', 'Trapezoidal', 'Trap Error', 'Simpson', 'Simp Error'};
    % Loop through the examples and perform the calculations, then print the results
columnNames = {'Test #', 'a', 'b', 'N', 'Integral', 'Trapezoidal', 'Trap Abs Error', 'Trap Rel Error', 'Simpson', 'Simp Abs Error', 'Simp Rel Error'};
results = {};
for i = 1:length(examples)
    a = examples{i}.a;
    b = examples{i}.b;
    N = examples{i}.N;
    func = examples{i}.Func;
    
    % Calculate the integral using MATLAB's integral function for comparison
    integral_result = integral(func, a, b);
    
    % Calculate the integral using the trapezoidal method
    trapezoidal_result = round(trapezoidal_general(a, b, N, func), 8);
    
    % Calculate the absolute and relative errors for the trapezoidal method
    trap_abs_error = abs(integral_result - trapezoidal_result);
    trap_rel_error = trap_abs_error / abs(integral_result);
    
    % Calculate the integral using the Simpson's method
    simpson_result = round(simpson_general(a, b, N, func), 8);
    
    % Calculate the absolute and relative errors for Simpson's method
    simp_abs_error = abs(integral_result - simpson_result);
    simp_rel_error = simp_abs_error / abs(integral_result);

    % Store the results in the new order with absolute and relative errors
    results(end+1, :) = {i, a, b, N, integral_result, trapezoidal_result, trap_abs_error, trap_rel_error, simpson_result, simp_abs_error, simp_rel_error};
end

end