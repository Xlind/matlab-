A=imread('D:\photo\me.jpg');
A1=rgb2gray(A);
subplot(3,3,1),imshow(A1),title('ԭʼͼ��');  
subplot(3,3,2),imhist(A1),title('ԭʼͼ��ֱ��ͼ');   
A2=imnoise(A1,'gaussian',0,0.038);
subplot(3,3,4),imshow(A2),title('�Ӹ�˹�������ͼ��');   
subplot(3,3,5),imhist(A2),title('����ͼ��ֱ��ͼ');   
c=graythresh(A2);
A3=im2bw(A2,c);
subplot(3,3,6),imshow(A3),title('Otsu�����õ��Ľ��');   
w=fspecial('average',5);
A4=imfilter(A1,w,'replicate');
subplot(3,3,7),imshow(A4),title('5*5ƽ��ģ��ƽ����Ĵ���ͼ��');
subplot(3,3,8),imhist(A4),title('ƽ�����ͼ��ֱ��ͼ');   
t=graythresh(A4);
A5=im2bw(A4,t);
subplot(3,3,9),imshow(A5),title('Otsu����������ֵ�����Ľ��');





