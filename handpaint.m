A=imread('D:\photo\88.jpg');
% imshow(A),title('ԭʼͼ��');
A= double(A)/255;%ת��255λ˫����ͼ
A = A+0.05*randn(size(A));%����һ����A��ͬ��ά����С���������
A(A<0) = 0; 
A(A>1) = 1;
w = 10;
sigma_c = 1;    %�ռ���sigmaѡȡ
sigma_s = 0.1;    %ֵ��sigmaѡȡ
B = bilateral_filter(A,w,sigma_c,sigma_s);
A1=rgb2gray(A);
f=tofloat(A1);
[gCanny_default,tc]=edge(f,'canny');
gCanny_best = edge(f, 'canny',[0.04 0.10],1.5);
t=A-gCanny_best*0.7;
%��ɫ��ǿ
R=t(:,:,1);   %�ֱ�ȡ��ά�����һά���õ���������������?
G=t(:,:,2);   %ΪR?G?B��?  
B=t(:,:,3);
r=R*1.3;
g=G*1.3;
b=B*1.3;
d=cat(3,r,g,b);
imshow(d),title('ת�ֻ����');