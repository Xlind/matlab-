Y=imread('D:\photo\my.jpg');
f=rgb2gray(Y);
I=im2double(f);
%ͼ��洢����ת��
T=dctmtx(8);%����8*8DCT�任����
%��ɢ���ұ任��
B=blkproc(I,[8,8],'P1*x*P2',T,T');%����8*8��������
mask=[1 1 1 1 0 0 0 0
1 1 1 0 0 0 0 0
1 1 0 0 0 0 0 0
1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0];
B2=blkproc(B,[8 8],'P1.*x',mask);
%����ѹ�����������½Ǹ�Ƶ����
I2=blkproc(B2,[8 8],'P1*x*P2',T',T);
%����DCT���任���õ�ѹ�����ͼ��
subplot(1,2,1);
imshow(I);title('ԭͼ');
subplot(1,2,2);
imshow(I2);title('ѹ�����ͼ��');