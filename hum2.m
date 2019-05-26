f = imread('D:\photo\me2.jpg');
I=rgb2gray(f);
[M,N] = size(I);
 I1 = I(:);
 P = zeros(1,256);
 %��ȡ�����ŵĸ��ʣ�
 for i = 0:255
     P(i+1) = length(find(I1 == i))/(M*N);
 end
 k = 0:255;
 dict = huffmandict(k,P);       %�����ֵ�
 enco = huffmanenco(I1,dict);   %����
 deco = huffmandeco(enco,dict); %����
 Ide = col2im(deco,[M,N],[M,N],'distinct'); %����������ת����ͼ��飻
 subplot(1,2,1);imshow(I);title('ԭʼͼ��');
 subplot(1,2,2);imshow(uint8(Ide));title('ѹ��ͼ��');