RGB = imread('D:\photo\mymy.jpg');    % 读取源图像并显示
R=RGB(:,:,1);   %分别取三维数组的一维，得到红绿蓝三个分量?
G=RGB(:,:,2);   %为R?G?B。?  
B=RGB(:,:,3);
r=histeq(R);%对个分量直方图均衡化，得到个分量均衡化图像?
g=histeq(G);
b=histeq(B);
A1=cat(3,r,g,b);
subplot(1,2,1),imshow(RGB),title('原始彩色图像');   
subplot(1,2,2),imshow(A1,[]);title('彩色图像均衡化后的图像');
