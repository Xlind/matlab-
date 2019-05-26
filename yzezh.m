A=imread('D:\photo\me.jpg');
A1=rgb2gray(A);
subplot(3,3,1),imshow(A1),title('原始图像');  
subplot(3,3,2),imhist(A1),title('原始图像直方图');   
A2=imnoise(A1,'gaussian',0,0.038);
subplot(3,3,4),imshow(A2),title('加高斯噪声后的图像');   
subplot(3,3,5),imhist(A2),title('加噪图像直方图');   
c=graythresh(A2);
A3=im2bw(A2,c);
subplot(3,3,6),imshow(A3),title('Otsu方法得到的结果');   
w=fspecial('average',5);
A4=imfilter(A1,w,'replicate');
subplot(3,3,7),imshow(A4),title('5*5平均模板平滑后的带噪图像');
subplot(3,3,8),imhist(A4),title('平滑后的图像直方图');   
t=graythresh(A4);
A5=im2bw(A4,t);
subplot(3,3,9),imshow(A5),title('Otsu方法进行阈值处理后的结果');





