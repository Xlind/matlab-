I = imread('D:\photo\mymy.jpg');   % ��ȡԴͼ����ʾ
subplot(121),imshow(I);
R=I(:,:,1);   %�ֱ�ȡ��ά�����һά���õ���������������?
G=I(:,:,2);   %ΪR?G?B��?  
B=I(:,:,3);
r=R*1.2;
g=G*1.3;
b=B*1.2;
d=cat(3,r,g,b);
subplot(122),imshow(d);