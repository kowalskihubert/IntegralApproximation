% Test metody trapezów i simpsona na kombinacji wielomianów Czebyszewa:

addpath("functions-examples/");

%Macierz_wynikow = zeros(24, 7);
%Macierz_wynikow(:,1) = [1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12];
%Macierz_wynikow(:,2) = [1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2];

a = -1;
b = 1;
N = 15;
a_k = [4 2 18 -4 2 0.5];

disp("Przybliżona wartość dla chebyshev_combination:")
s = trapezoidal(a, b, N, @chebyshev_combination, a_k)
% Gdy używamy metody trapezoidal(...), nie ma potrzeby definiowania nowej
% funkcji za każdym razem gdy chcemy zmienić wpółczynniki a_k lub wartość n.
% Wystarczy podać zmienione parametry do funkcji trapezoidal().

a = -1;
b = 1;
a_k = [4 2 18 -4];

disp("Przybliżona wartość dla chebyshev_combination skróconego:")
s = trapezoidal(a, b, N, @chebyshev_combination, a_k)

N = 50;
disp("Przybliżona wartość dla chebyshev_combination skróconego ze zwiększoną dokładnością:")
sd = trapezoidal(a, b, N, @chebyshev_combination, a_k)


% Aby sprawdzić poprawność obliczonych całek potrzebujemy funkcji z tylko
% jednym argumentem, aby przekazać ją do integral(...), należy więc
% stworzyć funkcję chebyshev_example_p (dla pewnego p), przy czym można w
% tej funkcji skorzystać z ogólnej chebyshev_combination

examples = cell(12,1);

% Example 1
%a = -2;
%b = 10;
%N = 50;
%s1 = trapezoidal_general(a, b, N, @chebyshev_example_1)
%s1_d = integral(@chebyshev_example_1, a, b)
%blad_wzgl = abs(s1_d - s1) / abs(s1_d)
%Macierz_wynikow(1, 3) = s1;
%Macierz_wynikow(1,4) = s1_d;
%Macierz_wynikow(1,5) = blad_wzgl;
%Macierz_wynikow(2, 3) = simpson_general(a,b,N,@chebyshev_example_1);
%Macierz_wynikow(2, 4) = integral(@chebyshev_example_1, a, b);
%Macierz_wynikow(2,5) = abs( (Macierz_wynikow(2,4)-Macierz_wynikow(2,3) )/Macierz_wynikow(2,4) )

examples{1} = struct(...
    'a', -2, ...
    'b', 10, ...
    'N', 50, ...
    'Func', @chebyshev_example_1);


% Example 2
s2 = trapezoidal_general(a, b, N, @chebyshev_example_2)
s2_d = integral(@chebyshev_example_2, a, b)
blad_wzgl_2 = abs(s2_d - s2) / abs(s2_d)
examples{2} = struct('a', -2, 'b', 10, 'N', 15, 'Func', @chebyshev_example_2);

% Example 3
a = 1;
b = 3;
s3 = trapezoidal_general(a, b, N, @chebyshev_example_3)
s3_d = integral(@chebyshev_example_3, a, b)
blad_wzgl_3 = abs(s3_d - s3) / abs(s3_d)

% Example 4
a = -0.5;
b = 0.5;
s4 = trapezoidal_general(a, b, N, @chebyshev_example_4)
s4_d = integral(@chebyshev_example_4, a, b)
blad_wzgl_4 = abs(s4_d - s4) / abs(s4_d)

% Example 5
a = -1;
b = 1;
N = 5; % Małe N
s5 = trapezoidal_general(a, b, N, @chebyshev_example_5)
s5_d = integral(@chebyshev_example_5, a, b)
blad_wzgl_5 = abs(s5_d - s5) / abs(s5_d)

% Example 6 - użyto funkcji z przykładu 5 aby porównać dokładność
N = 50; % Duże N
s6 = trapezoidal_general(a, b, N, @chebyshev_example_5)
s6_d = integral(@chebyshev_example_5, a, b)
blad_wzgl_6 = abs(s6_d - s6) / abs(s6_d)
w = simpson_general(a,b,N,@chebyshev_example_5)


% Example 7
N = 50;
a = -1.5;
b = -1;
s7 = trapezoidal_general(a, b, N, @chebyshev_example_7)
s7_d = integral(@chebyshev_example_7, a, b)
blad_wzgl_7 = abs(s7_d - s7) / abs(s7_d)

% Example 8
N = 50;
a = -1;
b = 1;
s8 = trapezoidal_general(a, b, N, @chebyshev_example_8)
s8_d = integral(@chebyshev_example_8, a, b)
blad_wzgl_8 = abs(s8_d - s8) / abs(s8_d)

% Example 9
N = 50;
a = -5;
b = 5;
s9 = trapezoidal_general(a, b, N, @chebyshev_example_9)
s9_d = integral(@chebyshev_example_9, a, b)
blad_wzgl_9 = abs(s9_d - s9) / abs(s9_d)

% Example 10 - równe pola, co wynika z parzystości
N = 50;
a = -0.7;
b = 0;
s10 = trapezoidal_general(a, b, N, @chebyshev_example_10)
s10_d = integral(@chebyshev_example_10, a, b)
blad_wzgl_10 = abs(s10_d - s10) / abs(s10_d)

a = 0;
b = 0.7;
s10b = trapezoidal_general(a, b, N, @chebyshev_example_10)
s10_db = integral(@chebyshev_example_10, a, b)
blad_wzgl_10b = abs(s10_db - s10b) / abs(s10_d)

roznica_pol = abs(s10_d - s10_db)

% Example 11 - inna kombinacja
N = 50;
a = -1;
b = -0.5;
s11 = trapezoidal_general(a, b, N, @example_11)
s11_d = integral(@example_11, a, b)
blad_wzgl_11 = abs(s11_d - s11) / abs(s11_d)

% Sprawdzenie parzystości - nie jest parzysta
a = 0.5;
b = 1;
s11b = integral(@example_11, a, b)

% Example 12
a = -10;
b = 10;
N = 100;
s12 = trapezoidal_general(a, b, N, @example_12)
s12_d = integral(@example_12, a, b)
blad_wzgl_12 = abs(s12_d - s12) / abs(s12_d)

% Assuming Macierz_wynikow is the matrix containing the results
disp('Test #   True Integral       Simpson           Simpson Diff       Simpson Error (%)   Trapezoidal       Trapezoidal Diff   Trapezoidal Error (%)');
for i = 1:size(Macierz_wynikow, 1)
    fprintf('%-8d %-20.12f %-20.12f %-20.12f %-20.2f %-20.12f %-20.12f %-20.2f\n', Macierz_wynikow(i, :));
end

