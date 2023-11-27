function tests = createSimpsonTestChebyshev(n, m)
%CREATESIMPSONTESTCHEBYSHEV Tworzy zestaw testów dla metody Simpsona.
%   Funkcja CREATESIMPSONTESTCHEBYSHEV generuje komórkę zawierającą struktury testów
%   z losowymi współczynnikami dla wielomianów Czebyszewa. Każda struktura zawiera
%   przedział całkowania, liczbę podprzedziałów oraz współczynniki funkcji wielomianowej.
%
%   Argumenty:
%       n - Liczba współczynników wielomianu, które zostaną wygenerowane losowo.
%       m - Liczba testów do wygenerowania.
%
%   Wyjście:
%       tests - Komórka zawierająca m struktur testów. Każda struktura ma pola:
%               'a' - dolna granica całkowania (ustawiona na -1),
%               'b' - górna granica całkowania (ustawiona na 1),
%               'N' - liczba podprzedziałów dla metody Simpsona (ustawiona na 100),
%               'f' - wektor losowych współczynników wielomianu o długości n.
%
%   Przykład użycia:
%       n = 4; % Liczba współczynników
%       m = 10; % Liczba testów
%       tests = createSimpsonTestChebyshev(n, m); % Wygenerowanie testów
%
%   Uwagi:
%       Współczynniki generowane są losowo z zakresu od 0 do 5 dla każdego testu.
%       Granice całkowania są stałe i wynoszą [-1, 1].

    tests = cell(m, 1);
    
    % Generowanie testów
    for i = 1:m
        % Losowanie współczynników wielomianu
        coefficients = randi([0, 5], 1, n);
        newTest = struct(...
            'a', -1,...  % Dolna granica całkowania
            'b', 1,...   % Górna granica całkowania
            'N', 100,... % Liczba podprzedziałów
            'f', coefficients); % Współczynniki funkcji wielomianowej
        tests{i} = newTest;
    end
end
