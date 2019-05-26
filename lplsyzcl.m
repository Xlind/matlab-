A=imread('D:\photo\me.jpg');
A1=rgb2gray(A);
subplot(2,3,1),imshow(A1),title('原始图像');  
f = tofloat(A1);
subplot(2,3,2),imhist(f),title('图像直方图');   
[Tf SMf] = graythresh(f);
SMf
Tf
gf = im2bw(f, Tf);      
subplot(2,3,3),imshow(gf),title('阈值图像');  
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];
lap = abs(imfilter(f, w, 'replicate')); 
lap = lap/max(lap(:));
h = imhist(lap);
Q = percentile2i(h, 0.995);
markerImage = lap > Q;
fp = f.*markerImage;
subplot(2,3,4),imshow(fp),title('标记图像与原始图像的乘积');   
hp = imhist(fp);
hp(1) = 0;
subplot(2,3,5),bar(hp, 1),title('图4中非零像素的直方图');   
T = otsuthresh(hp);
T*(numel(hp) - 1)
g = im2bw(f, T);
subplot(2,3,6),imshow(g),title('Otsu方法进行阈值处理后的图像'); 




