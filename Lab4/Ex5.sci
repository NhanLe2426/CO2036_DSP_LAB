// Cai dat thu vien IPCV
atomsLoad('IPCV');

// Doc anh RGB tu may tinh : Vi du lay anh logo truong HCMUT
img_rgb = imread('D:\Assignment\SciLab_DSP_Lab\Lab4\hcmut.png'); 

// Chuyen doi anh mau sang anh xam (Grayscale)
img_gray = rgb2gray(img_rgb);

// Tao bo loc lam mo (Average filter kich thuoc 5x5)
// Tang kich thuoc bo loc len 35x35 de thay ro hieu ung lam mo
h_blur = fspecial('average', 35);
img_blur = imfilter(img_gray, h_blur);

// Hien thi ket qua len cung mot cua so do hoa
figure();

// Hang 1: Hien thi anh
subplot(2, 2, 1); 
imshow(img_rgb); 
title('1. Anh goc (RGB Color)');

subplot(2, 2, 2); 
imshow(img_gray); 
title('2. Anh xam (Grayscale)');

// Hang 2: Hien thi Histogram va Anh da lam mo
subplot(2, 2, 3); 
// Lay mang du lieu dem so luong pixel (count) va cac muc xam (cells)
[count, cells] = imhist(img_gray); 
// Ve do thi dang cot (plot2d3) de ep no hien vao subplot
plot2d3(cells, count); 
title('3. Bieu do Histogram cua Anh xam');

subplot(2, 2, 4); 
imshow(img_blur); 
title('4. Anh xam sau khi lam mo (Blur)');
