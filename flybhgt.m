I=imread('D:\photo\me.jpg');
f=rgb2gray(I);
[f,revertclass]=tofloat(f);   %把输入图像转换为浮点图像
PQ=paddedsize(size(f));  %使用函数paddedsize获得填充参数
%当f被填充之后，频率域中的滤波器函数的尺寸PQ(1)*PQ(2)
[U,V]=dftuv(PQ(1),PQ(2));  %实现频域滤波器的网格函数 
D0=0.05*PQ(1);
F=fft2(f,PQ(1),PQ(2));  %得到有填充图像的傅里叶变换
H=hpfilter('gaussian',PQ(1),PQ(2),D0); %高斯高通滤波器
g=dftfilt(f,H);   %输入图像和滤波函数
g=revertclass(g);
subplot(2,2,1),imshow(f),title('原始图像');
subplot(2,2,2),imshow(fftshift(H)),title('高斯高通滤波器');
subplot(2,2,3),imshow(log(1+abs(fftshift(F))),[]),title('原始图像的谱');
subplot(2,2,4),imshow(g,[]),title('频域高通滤波后的图像');








