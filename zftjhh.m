A=imread('D:\photo\a.jpg');%����ͼ��
A1=rgb2gray(A);
subplot(3,2,1);imshow(A1);%��ʾԭʼͼ��
title('ԭʼͼ��');
subplot(3,2,2);imhist(A1);
title('ԭʼͼ��ֱ��ͼ');
axis([0 255 0 10000]);
A2=histeq(A1);%��ͼ����о��⻯����
subplot(3,2,3);imshow(A2);title('���⻯�����ͼ��');
subplot(3,2,4);imhist(A2);title('���⻯�����ֱ��ͼ');
axis([0 255 0 10000]);
hgram=50:2:250;%%50�ǳ�ֵ��2�ǲ��������������ǣ�505254...250����250����
%�涨������
A3=histeq(A1,hgram);
subplot(3,2,5);imshow(A3);title('�涨�������ͼ��');
subplot(3,2,6);imhist(A3);title('�涨�������ֱ��ͼ');
axis([0 255 0 10000]);


