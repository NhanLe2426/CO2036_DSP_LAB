// 1. Tao vector v1 = (x1 + 1, x2 + 1, x3 + 1, x4 + 1)
x = 1 : 4;
v1 = x + 1;
disp("Vector v1: ", v1)

// 2. Tao vector v2 = (x1y1, x2y2, x3y3, x4y4)
x = 1 : 4;
y = 5 : 8;
v2 = x .* y;
disp("Vector v2: ", v2)

// 3. Tao vector v3 = (sin(x1), ... , sin(x10)) trong khoang [0 , pi]
x_linear = linspace(0, %pi, 10);
v3 = sin(x_linear);
disp("Vector v3: ", v3)
 
