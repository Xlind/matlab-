A=imread('D:\photo\me.jpg');
f=rgb2gray(A);
subplot(2,3,1),imshow(f),title('原始图像');  
%计算梯度
f=tofloat(f);
sx=fspecial('sobel');
sy=sx';
gx=imfilter(f,sx,'replicate');
gy=imfilter(f,sy,'replicate');
grad=sqrt(gx.^2+gy.^2);
grad=grad/max(grad(:));
subplot(2,3,2),imhist(grad),title('图像直方图');  
%得到grad 的直方图，并使用高的百分比(99.9%)估计梯度的阈值
h=imhist(grad);
Q=percentile2i(h,0.999);
%用Q 对梯度做阈值处理，形成标记图像，并且从f 中提取梯度值比Q大的点，得到结果的直方图：
markerImage=grad>Q;
subplot(2,3,3),imshow(markerImage),title('阈值处理后的梯度幅度图像');  
fp=f.*markerImage;
subplot(2,3,4),imshow(fp),title('图1和图3的乘积形成的图像');  
hp=imhist(fp);
%用结果的直方图得到Otsu 阈值
hp(1)=0;
subplot(2,3,5),bar(hp,1),title('图4中非零像素的直方图'); 
T=otsuthresh(hp);
T*(numel(hp) - 1)
g=im2bw(f,T);
subplot(2,3,6),imshow(g),title('阈值分割图');  

