A=imread('D:\photo\me.jpg');
f=rgb2gray(A);
%ȫ����ֵ�ָ�
count=0;
T=mean2(f);
done=false;
while ~done
    count=count+1;
    g=f>T;
    Tnext=0.5*(mean(f(g))+mean(f(~g)));
    done=abs(T-Tnext)<0.5;
    T=Tnext;
end
count
T
g=im2bw(f,T/255);
subplot(2,2,1);imshow(f);title('ԭͼ��');
subplot(2,2,2);imhist(f);title('ԭʼͼ��ֱ��ͼ');
subplot(2,2,3);imshow(g);title('��ֵ��ͼ��');