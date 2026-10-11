clf();
// Set up a time axis wide enough to observe
n = -2:8; 

// (1) Sketch signal x(n) = 1 with 0 <= n <= 3
xn = bool2s(n >= 0 & n <= 3);

subplot(3, 2, 1);
plot2d3(n, xn); plot(n, xn, "ro");
title("(1) Input signal x(n)");
xlabel("n"); ylabel("x(n)");

// (2) Determine and sketch signal y(n) = x(n) - x(n-1)
xn_delayed = [0, xn(1:$-1)]; 
yn = xn - xn_delayed;

subplot(3, 2, 2);
plot2d3(n, yn); plot(n, yn, "bo");
title("(2) Output y(n) = x(n) - x(n-1)");
xlabel("n"); ylabel("y(n)");

// (3) Sketch signal y1(n) = y(n-2)
y1 = [zeros(1, 2), yn(1:$-2)];

subplot(3, 2, 3);
plot2d3(n, y1); plot(n, y1, "go");
title("(3) Shifted output y1(n) = y(n-2)");
xlabel("n"); ylabel("y1(n)");

// (4) Determine and sketch signal x2(n) = x(n-2)
x2 = [zeros(1, 2), xn(1:$-2)];

subplot(3, 2, 4);
plot2d3(n, x2); plot(n, x2, "mo");
title("(4) Shifted input x2(n) = x(n-2)");
xlabel("n"); ylabel("x2(n)");

// (5) Determine and sketch signal y2(n) = T[x2(n)] = x2(n) - x2(n-1)
x2_delayed = [0, x2(1:$-1)];
y2 = x2 - x2_delayed;

subplot(3, 2, 5);
plot2d3(n, y2); plot(n, y2, "ko");
title("(5) Output of shifted input y2(n)");
xlabel("n"); ylabel("y2(n)");
