%DCT transform
Y=imread('D:\photo\my.jpg');
f=rgb2gray(Y);
I=im2double(f);
T=dctmtx(8); %����8*8DCT�任����
B=blkproc(I,[8,8],'P1*x*P2',T,T');%����8*8��������
%mask=ones(8);
mask1=[1 1 1 1 1 0 0 0
1 1 1 1 0 0 0 0
1 1 1 0 0 0 0 0
1 1 0 0 0 0 0 0
1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0];

mask2=[1 1 1 1 0 0 0 0
1 1 1 0 0 0 0 0
1 1 0 0 0 0 0 0
1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0];

mask3=[0.1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0];

B1=blkproc(B,[8 8],'P1.*x',mask1);
IB1=blkproc(B1,[8 8],'P1*x*P2',T',T);
% IB1=uint8(IB1);

B2=blkproc(B,[8 8],'P1.*x',mask2);
IB2=blkproc(B2,[8 8],'P1*x*P2',T',T);
% IB2=uint8(IB2);

B3=blkproc(B,[8 8],'P1.*x',mask3);
IB3=blkproc(B3,[8 8],'P1*x*P2',T',T);
% IB3=uint8(IB3);

subplot(141),imshow(I),title('ԭʼͼ��');
subplot(142),imshow(IB1),title('DCT(15)�任');
subplot(143),imshow(IB2),title('DCT(10)�任');
subplot(144)imshow(IB3),title('DCT(3)�任');

