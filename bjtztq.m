% 使用函数minperpoly
r= imread('D:\photo\me111.jpg');
f=im2bw(r,0.5);
 subplot(2,3,1), imshow(f), title('原图')
 b = boundaries(f, 4, 'cw'); %找出b的边界
 b = b{1}; %因为这幅图比较特殊，它只有一个边界物体
 [M, N] = size(f);
 xmin = min(b(:, 1));
 ymin = min(b(:, 2));
 bim = bound2im(b, M, N, xmin, ymin);
 subplot(2,3,2), imshow(bim), title('找出的边界图像')
 % [x, y] = minperpoly(F, CELLSIZE)为计算二值图像的最小周长多边形
 [x, y] = minperpoly(f, 2);  %2为用于形成边界方形的大小，x和y是MPP上顶点的坐标
 b2 = connectpoly(x, y);  %将顶点依次连接成多边形
 B2 = bound2im(b2, M, N, xmin, ymin);
 subplot(2,3,3), imshow(B2), title('使用大小为2*2的方形边界单元获得的MPP')
 [x, y] = minperpoly(f, 3);
 b3 = connectpoly(x, y);
 B3 = bound2im(b3, M, N, xmin, ymin);
 subplot(2,3,4), imshow(B3), title('使用大小为3*3的方形边界单元获得的MPP')
 [x, y] = minperpoly(f, 4);
 b4 = connectpoly(x, y);
 B4 = bound2im(b4, M, N, xmin, ymin);
 subplot(2,3,5), imshow(B4), title('使用大小为4*4的方形边界单元获得的MPP')
 [x, y] = minperpoly(f, 8);
 b8 = connectpoly(x, y);
 B8 = bound2im(b8, M, N, xmin, ymin);
 subplot(2,3,6), imshow(B8), title('使用大小为8*8的方形边界单元获得的MPP')