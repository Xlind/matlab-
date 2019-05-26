I=imread('D:\photo\me.jpg');
I1=rgb2gray(I);
subplot(2,2,1),imshow(I1),title('原始图像');
J=imnoise(I1,'salt & pepper');
subplot(2,2,2),imshow(J),title('加椒盐噪声图像');
h=fspecial('average',3);
I2=filter2(h,J);
I3=medfilt2(J,[3 3]);
subplot(2,2,3),imshow(I2,[]),title('均值滤波');
subplot(2,2,4),imshow(I3),title('中值滤波');


