// Folding and Shifting
function [y, ny] = circular_conv_shift(x, nx, h, nh)
    N = length(x);
    M = length(h);
    ny = 0:N-1;
    y = zeros(1, N);
    
    for i = 1:length(ny)
        n = ny(i);
        for k_idx = 1:M
            k = nh(k_idx);
            // Cong thuc: h(k) * x((n-k) mod N)
            idx_x = pmodulo(n - k, N) + 1; 
            y(i) = y(i) + h(k_idx) * x(idx_x);
        end
    end
endfunction

// Matrix
function [y, ny] = circular_conv_matrix(x, nx, h, nh)
    N = length(x);
    M = length(h);
    ny = 0:N-1;
    
    X_mat = zeros(N, M);
    for i = 1:N
        n = ny(i);
        for j = 1:M
            k = nh(j);
            idx_x = pmodulo(n - k, N) + 1;
            X_mat(i, j) = x(idx_x);
        end
    end
    y = (X_mat * h(:))'; 
endfunction

x = [1, 2, -3, 2, 1]; 
nx = 0:4;
h = [1, 0, -1, -1, 1]; 
nh = 0:4;

// Tinh toan
[y1, ny1] = circular_conv_shift(x, nx, h, nh);
[y2, ny2] = circular_conv_matrix(x, nx, h, nh);
Ex = x.^2;
Ey = y1.^2;

// Ve do thi
clf();
subplot(2, 2, 1);
plot2d3(nx, x); plot(nx, x, "ro");
title("Periodic Signal x(n)"); xgrid();

subplot(2, 2, 2);
plot2d3(ny1, y1); plot(ny1, y1, "bo");
title("Circular Convolution y(n) - Folding and Shifting"); xgrid();

subplot(2, 2, 4);
plot2d3(ny2, y2); plot(ny2, y2, "go");
title("Circular Convolution y(n) - Matrix"); xgrid();

subplot(2, 2, 3);
plot(nx, Ex, "r-o");
plot(ny1, Ey, "b-o");
legend(["Ex", "Ey"]);
title("Energy of Discrete signals"); xgrid();
