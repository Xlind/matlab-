f = imread('D:\photo\me2.jpg');
I=rgb2gray(f);
[M,N] = size(I);
 I1 = I(:);
 P = zeros(1,256);
 %获取各符号的概率；
 for i = 0:255
     P(i+1) = length(find(I1 == i))/(M*N);
 end
 k = 0:255;
 dict = huffmandict(k,P);       %生成字典
 enco = huffmanenco(I1,dict);   %编码
 deco = huffmandeco(enco,dict); %解码
 Ide = col2im(deco,[M,N],[M,N],'distinct'); %把向量重新转换成图像块；
 subplot(1,2,1);imshow(I);title('原始图像');
 subplot(1,2,2);imshow(uint8(Ide));title('压缩图像');