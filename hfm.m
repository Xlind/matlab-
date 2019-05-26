Y=imread('D:\photo\my.jpg');
f=rgb2gray(Y);
I=im2double(f);
%图像存储类型转换
T=dctmtx(8);%返回8*8DCT变换矩阵
%离散余弦变换矩
B=blkproc(I,[8,8],'P1*x*P2',T,T');%进行8*8分离块操作
mask=[1 1 1 1 0 0 0 0
1 1 1 0 0 0 0 0
1 1 0 0 0 0 0 0
1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0];
B2=blkproc(B,[8 8],'P1.*x',mask);
%数据压缩，丢弃右下角高频数据
I2=blkproc(B2,[8 8],'P1*x*P2',T',T);
%进行DCT反变换，得到压缩后的图像
subplot(1,2,1);
imshow(I);title('原图');
subplot(1,2,2);
imshow(I2);title('压缩后的图像');