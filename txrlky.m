I=imread('D:\photo\me.jpg'); 
J=rgb2gray(I); 
subplot(131);imshow(J);title('ԭʼͼ��');
[high,width]=size(J);
newGrayPic=J;    %Ϊ����ͼ��ı�Եһ������
robertsNum=0;    %��Roberts���Ӽ���õ���ÿ�����ص�ֵ
robertThreshold=0.9;   %�趨��ֵ
for j=1:high-1   %���б߽���ȡ
    for k=1:width-1
        robertsNum = abs(J(j,k)-J(j+1,k+1)) + abs(J(j+1,k)-J(j,k+1));
        newGrayPic(j,k)=robertsNum;
    end
end
subplot(132);imshow(newGrayPic);title('roberts�����񻯵�ͼ��');
BW3 = edge(J,'roberts', 0.03);
subplot(133);imshow(BW3,[]);title('Matlab�Դ�������Ե���');