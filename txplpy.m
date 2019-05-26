I=imread('D:\photo\me.jpg');
f=rgb2gray(I);
[row,col]=size(f);
g=fft2(f); %二维离散傅里叶变换
gls=fftshift(g);
H=zeros(row,col);
x0=floor(row/2);
y0=floor(col/2);
u0=x0;v0=y0;
D0=50;   %截止频率
n=0.2;    %滤波器阶数
for u=1:row
    for v=1:col
        D=(u-u0)^2+(v-v0)^2;
        H(u,v)=1/(1+(D/D0)^(2*n));
    end
end
rss=gls.*H;   %滤波
rs=ifftshift(rss);  %反频移
r=real(ifft2(rs));  %反变换
subplot(2,2,1),imshow(f),title('原始图像');
subplot(2,2,2),imshow(uint8(r)),title('平滑后的图像');
subplot(2,2,3);
H1=H(x0,y0:col);
plot(H1),title('频域低通滤波');
axis([0 y0 min(H1) max(H1)]);

