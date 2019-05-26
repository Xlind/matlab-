A=imread('D:\photo\me.jpg');
A1=rgb2gray(A);
subplot(1,3,1),imshow(A),title('原始图像');    %显示图像
subplot(1,3,2),imshow(A1),title('灰度图像');    %灰度图像
A2=fft2(A1);
A2=fftshift(A2);   %进行二维傅里叶变换?
S=log(abs(A2)+1);
subplot(1,3,3),imshow(S,[0,12]);  %显示傅里叶变换后的图像?
title('傅里叶变换后的图像');

