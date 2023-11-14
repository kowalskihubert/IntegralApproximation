function I = simpson(f, a, b, N)
    k = 1:(N);
    xCzeb = cos((2*k + 1) * pi / (2 * N));
    xCzeb = 0.5 * ((b - a) * xCzeb + (b + a));
    I = 0;
    for k = 1:N/2
        xLeft = xCzeb(2*k - 1);
        xRight = xCzeb(2*k);
        I = I + simpsonSimplified(f, xLeft, xRight);
    end
end