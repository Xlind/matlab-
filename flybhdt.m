I=imread('D:\photo\me.jpg');
f=rgb2gray(I);  
[f,revertclass]=tofloat(f);   %������ͼ��ת��Ϊ����ͼ��
PQ=paddedsize(size(f));  %ʹ�ú���paddedsize���������
%��f�����֮��Ƶ�����е��˲��������ĳߴ�PQ(1)*PQ(2)
[U,V]=dftuv(PQ(1),PQ(2));  %ʵ��Ƶ���˲����������� 
D=hypot(U,V);
D0=0.05*PQ(2);  %D0ֵΪ�����ͼ���ȵ�5%
F=fft2(f,PQ(1),PQ(2));  %�õ������ͼ��ĸ���Ҷ�任
H=exp(-(D.^2)/(2*(D0^2))); %�����˹��ͨ�˲���
g=dftfilt(f,H);   %����ͼ����˲�����
g=revertclass(g);
subplot(2,2,1),imshow(f),title('ԭʼͼ��');
subplot(2,2,2),imshow(fftshift(H)),title('��˹��ͨ�˲���');
subplot(2,2,3),imshow(log(1+abs(fftshift(F))),[]),title('ԭʼͼ�����');
subplot(2,2,4),imshow(g),title('Ƶ���ͨ�˲����ͼ��');





