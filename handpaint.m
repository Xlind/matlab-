A=imread('D:\photo\88.jpg');
% imshow(A),title('原始图像');
A= double(A)/255;%转成255位双精度图
A = A+0.05*randn(size(A));%返回一个和A有同样维数大小的随机数组
A(A<0) = 0; 
A(A>1) = 1;
w = 10;
sigma_c = 1;    %空间域sigma选取
sigma_s = 0.1;    %值域sigma选取
B = bilateral_filter(A,w,sigma_c,sigma_s);
A1=rgb2gray(A);
f=tofloat(A1);
[gCanny_default,tc]=edge(f,'canny');
gCanny_best = edge(f, 'canny',[0.04 0.10],1.5);
t=A-gCanny_best*0.7;
%颜色增强
R=t(:,:,1);   %分别取三维数组的一维，得到红绿蓝三个分量?
G=t(:,:,2);   %为R?G?B。?  
B=t(:,:,3);
r=R*1.3;
g=G*1.3;
b=B*1.3;
d=cat(3,r,g,b);
imshow(d),title('转手绘风格后');