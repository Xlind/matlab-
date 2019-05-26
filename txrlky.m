I=imread('D:\photo\me.jpg'); 
J=rgb2gray(I); 
subplot(131);imshow(J);title('原始图像');
[high,width]=size(J);
newGrayPic=J;    %为保留图像的边缘一个像素
robertsNum=0;    %经Roberts算子计算得到的每个像素的值
robertThreshold=0.9;   %设定阈值
for j=1:high-1   %进行边界提取
    for k=1:width-1
        robertsNum = abs(J(j,k)-J(j+1,k+1)) + abs(J(j+1,k)-J(j,k+1));
        newGrayPic(j,k)=robertsNum;
    end
end
subplot(132);imshow(newGrayPic);title('roberts算子锐化的图像');
BW3 = edge(J,'roberts', 0.03);
subplot(133);imshow(BW3,[]);title('Matlab自带函数边缘检测');