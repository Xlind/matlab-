A=imread('D:\photo\me.jpg');
f=rgb2gray(A);
subplot(2,4,1),imshow(f),title('原始图像');  
subplot(2,4,2),imhist(f),title('原始图像直方图');   
h=fspecial('sobel');
fd=tofloat(f);
g=sqrt(imfilter(fd,h,'replicate').^2+imfilter(fd,h','replicate').^2);
subplot(2,4,3),imshow(g),title('梯度幅度图像');  
subplot(2,4,4),imhist(g),title('梯度幅度图像直方图');   
L=watershed(g);
wr=L==0;
subplot(2,4,5),imshow(wr),title('分水岭变换');   
subplot(2,4,6),imhist(wr),title('分水岭变换');  
g2=imclose(imopen(g,ones(3,3)),ones(3,3));
L2=watershed(g2);
wr2=L2==0;
f2=f;
f2(wr2)=255;
subplot(2,4,7),imshow(f2),title('平滑梯度图像的分水岭变换'); 
subplot(2,4,8),imhist(f2),title('平滑梯度图像的分水岭变换');
