RGB = imread('D:\photo\mymy.jpg');    % ��ȡԴͼ����ʾ
R=RGB(:,:,1);   %�ֱ�ȡ��ά�����һά���õ���������������?
G=RGB(:,:,2);   %ΪR?G?B��?  
B=RGB(:,:,3);
r=histeq(R);%�Ը�����ֱ��ͼ���⻯���õ����������⻯ͼ��?
g=histeq(G);
b=histeq(B);
A1=cat(3,r,g,b);
subplot(1,2,1),imshow(RGB),title('ԭʼ��ɫͼ��');   
subplot(1,2,2),imshow(A1,[]);title('��ɫͼ����⻯���ͼ��');
