I=imread('D:\photo\me.jpg');
f=rgb2gray(I);
[row,col]=size(f);
g=fft2(f); %��ά��ɢ����Ҷ�任
gls=fftshift(g);
H=zeros(row,col);
x0=floor(row/2);
y0=floor(col/2);
u0=x0;v0=y0;
D0=50;   %��ֹƵ��
n=0.2;    %�˲�������
for u=1:row
    for v=1:col
        D=(u-u0)^2+(v-v0)^2;
        H(u,v)=1/(1+(D/D0)^(2*n));
    end
end
rss=gls.*H;   %�˲�
rs=ifftshift(rss);  %��Ƶ��
r=real(ifft2(rs));  %���任
subplot(2,2,1),imshow(f),title('ԭʼͼ��');
subplot(2,2,2),imshow(uint8(r)),title('ƽ�����ͼ��');
subplot(2,2,3);
H1=H(x0,y0:col);
plot(H1),title('Ƶ���ͨ�˲�');
axis([0 y0 min(H1) max(H1)]);

