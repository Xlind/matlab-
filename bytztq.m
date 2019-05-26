Y=imread('D:\photo\me111.jpg');
Yi=rgb2gray(Y);
subplot(2,3,1),imshow(Yi),title('原始图像');   
h=fspecial('average',9);  %9*9平滑算子
g=imfilter(Yi,h,'replicate');   %滤波
subplot(2,3,2),imshow(g);title('中值滤波后图像');
gB=im2bw(g,0.5);   %将原图像转换为二值图像
subplot(2,3,3),imshow(gB);title('阈值处理后的图像');
B=bwboundaries(gB,'noholes');   %跟踪目标的边界
d=cellfun('length',B);   %函数cellfun(FUN,C)是指对一个单元数组中的每一个单元应用函数FUN
[maxd,k]=max(d);  %返回向量d中最大的值，存在max_d中，k为其索引
b=B{k};%如果最大边界不止一条，则取出其中的一条即可。b是一个坐标数组
[M N]=size(g);
g=bound2im(b,M,N); %函数bound2im(b,M,N,x0,y0)是生成一副二值图像,大小为M*N，x0和y0是b中最小的x和y轴坐标
subplot(2,3,4),imshow(g);title('二值图像的边界');
[s,su]=bsubsamp(b,50);   %指的是对边界B进行子采样，每个GRIDSEP个点采样一次
%输出S是采样后的值，输出SU是归一化的边界
g2=bound2im(s,M,N);
subplot(2,3,5),imshow(g);title('子取样后的边界');
cn=connectpoly(s(:,1),s(:,2));   %将二次取样后断点重连，函数是按照坐标(X,Y)顺时针或者逆时针连接成多边形
g3=bound2im(cn,M,N);
subplot(2,3,6),imshow(g3);title('连接成多边形图像');
cn=fchcode(su);

