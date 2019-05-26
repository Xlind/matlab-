I = imread('D:\photo\mymy.jpg');   % 读取源图像并显示
subplot(121),imshow(I);
R=I(:,:,1);   %分别取三维数组的一维，得到红绿蓝三个分量?
G=I(:,:,2);   %为R?G?B。?  
B=I(:,:,3);
r=R*1.2;
g=G*1.3;
b=B*1.2;
d=cat(3,r,g,b);
subplot(122),imshow(d);