n = -2 : 2;
x = [2, 3, 4, 5, 6];

nf = -2 : 2;
xf = [6, 5, 4, 3, 2];

xe = 0.5 * (x + xf);
xo = 0.5 * (x - xf);

subplot(3, 1, 1);
plot2d3(n, x); plot(n, x, "ro");
title("Original Signal x(n)");
xlabel("n"); ylabel("x(n)");

subplot(3, 1, 2);
plot2d3(n, xe); plot(n, xe, "go");
title("Even Component xe(n)");
xlabel("n"); ylabel("xe(n)");

subplot(3, 1, 3);
plot2d3(n, xo); plot(n, xo, "bo");
title("Odd Component xo(n)");
xlabel("n"); ylabel("xo(n)");
