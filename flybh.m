A=imread('D:\photo\me.jpg');
A1=rgb2gray(A);
subplot(1,3,1),imshow(A),title('ԭʼͼ��');    %��ʾͼ��
subplot(1,3,2),imshow(A1),title('�Ҷ�ͼ��');    %�Ҷ�ͼ��
A2=fft2(A1);
A2=fftshift(A2);   %���ж�ά����Ҷ�任?
S=log(abs(A2)+1);
subplot(1,3,3),imshow(S,[0,12]);  %��ʾ����Ҷ�任���ͼ��?
title('����Ҷ�任���ͼ��');

