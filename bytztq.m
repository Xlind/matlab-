Y=imread('D:\photo\me111.jpg');
Yi=rgb2gray(Y);
subplot(2,3,1),imshow(Yi),title('ԭʼͼ��');   
h=fspecial('average',9);  %9*9ƽ������
g=imfilter(Yi,h,'replicate');   %�˲�
subplot(2,3,2),imshow(g);title('��ֵ�˲���ͼ��');
gB=im2bw(g,0.5);   %��ԭͼ��ת��Ϊ��ֵͼ��
subplot(2,3,3),imshow(gB);title('��ֵ������ͼ��');
B=bwboundaries(gB,'noholes');   %����Ŀ��ı߽�
d=cellfun('length',B);   %����cellfun(FUN,C)��ָ��һ����Ԫ�����е�ÿһ����ԪӦ�ú���FUN
[maxd,k]=max(d);  %��������d������ֵ������max_d�У�kΪ������
b=B{k};%������߽粻ֹһ������ȡ�����е�һ�����ɡ�b��һ����������
[M N]=size(g);
g=bound2im(b,M,N); %����bound2im(b,M,N,x0,y0)������һ����ֵͼ��,��СΪM*N��x0��y0��b����С��x��y������
subplot(2,3,4),imshow(g);title('��ֵͼ��ı߽�');
[s,su]=bsubsamp(b,50);   %ָ���ǶԱ߽�B�����Ӳ�����ÿ��GRIDSEP�������һ��
%���S�ǲ������ֵ�����SU�ǹ�һ���ı߽�
g2=bound2im(s,M,N);
subplot(2,3,5),imshow(g);title('��ȡ����ı߽�');
cn=connectpoly(s(:,1),s(:,2));   %������ȡ����ϵ������������ǰ�������(X,Y)˳ʱ�������ʱ�����ӳɶ����
g3=bound2im(cn,M,N);
subplot(2,3,6),imshow(g3);title('���ӳɶ����ͼ��');
cn=fchcode(su);

