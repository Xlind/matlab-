A=imread('D:\photo\me.jpg');
f=rgb2gray(A);
subplot(2,3,1),imshow(f),title('ԭʼͼ��');  
%�����ݶ�
f=tofloat(f);
sx=fspecial('sobel');
sy=sx';
gx=imfilter(f,sx,'replicate');
gy=imfilter(f,sy,'replicate');
grad=sqrt(gx.^2+gy.^2);
grad=grad/max(grad(:));
subplot(2,3,2),imhist(grad),title('ͼ��ֱ��ͼ');  
%�õ�grad ��ֱ��ͼ����ʹ�øߵİٷֱ�(99.9%)�����ݶȵ���ֵ
h=imhist(grad);
Q=percentile2i(h,0.999);
%��Q ���ݶ�����ֵ�����γɱ��ͼ�񣬲��Ҵ�f ����ȡ�ݶ�ֵ��Q��ĵ㣬�õ������ֱ��ͼ��
markerImage=grad>Q;
subplot(2,3,3),imshow(markerImage),title('��ֵ�������ݶȷ���ͼ��');  
fp=f.*markerImage;
subplot(2,3,4),imshow(fp),title('ͼ1��ͼ3�ĳ˻��γɵ�ͼ��');  
hp=imhist(fp);
%�ý����ֱ��ͼ�õ�Otsu ��ֵ
hp(1)=0;
subplot(2,3,5),bar(hp,1),title('ͼ4�з������ص�ֱ��ͼ'); 
T=otsuthresh(hp);
T*(numel(hp) - 1)
g=im2bw(f,T);
subplot(2,3,6),imshow(g),title('��ֵ�ָ�ͼ');  

