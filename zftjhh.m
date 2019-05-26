A=imread('D:\photo\a.jpg');%导入图像
A1=rgb2gray(A);
subplot(3,2,1);imshow(A1);%显示原始图像
title('原始图像');
subplot(3,2,2);imhist(A1);
title('原始图像直方图');
axis([0 255 0 10000]);
A2=histeq(A1);%对图像进行均衡化处理
subplot(3,2,3);imshow(A2);title('均衡化处理后图像');
subplot(3,2,4);imhist(A2);title('均衡化处理后直方图');
axis([0 255 0 10000]);
hgram=50:2:250;%%50是初值，2是步长，生成向量是：505254...250；到250结束
%规定化函数
A3=histeq(A1,hgram);
subplot(3,2,5);imshow(A3);title('规定化处理后图像');
subplot(3,2,6);imhist(A3);title('规定化处理后直方图');
axis([0 255 0 10000]);


