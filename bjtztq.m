% ʹ�ú���minperpoly
r= imread('D:\photo\me111.jpg');
f=im2bw(r,0.5);
 subplot(2,3,1), imshow(f), title('ԭͼ')
 b = boundaries(f, 4, 'cw'); %�ҳ�b�ı߽�
 b = b{1}; %��Ϊ���ͼ�Ƚ����⣬��ֻ��һ���߽�����
 [M, N] = size(f);
 xmin = min(b(:, 1));
 ymin = min(b(:, 2));
 bim = bound2im(b, M, N, xmin, ymin);
 subplot(2,3,2), imshow(bim), title('�ҳ��ı߽�ͼ��')
 % [x, y] = minperpoly(F, CELLSIZE)Ϊ�����ֵͼ�����С�ܳ������
 [x, y] = minperpoly(f, 2);  %2Ϊ�����γɱ߽緽�εĴ�С��x��y��MPP�϶��������
 b2 = connectpoly(x, y);  %�������������ӳɶ����
 B2 = bound2im(b2, M, N, xmin, ymin);
 subplot(2,3,3), imshow(B2), title('ʹ�ô�СΪ2*2�ķ��α߽絥Ԫ��õ�MPP')
 [x, y] = minperpoly(f, 3);
 b3 = connectpoly(x, y);
 B3 = bound2im(b3, M, N, xmin, ymin);
 subplot(2,3,4), imshow(B3), title('ʹ�ô�СΪ3*3�ķ��α߽絥Ԫ��õ�MPP')
 [x, y] = minperpoly(f, 4);
 b4 = connectpoly(x, y);
 B4 = bound2im(b4, M, N, xmin, ymin);
 subplot(2,3,5), imshow(B4), title('ʹ�ô�СΪ4*4�ķ��α߽絥Ԫ��õ�MPP')
 [x, y] = minperpoly(f, 8);
 b8 = connectpoly(x, y);
 B8 = bound2im(b8, M, N, xmin, ymin);
 subplot(2,3,6), imshow(B8), title('ʹ�ô�СΪ8*8�ķ��α߽絥Ԫ��õ�MPP')