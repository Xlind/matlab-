function [ tonedMap ] = navieBilateral( radMap,dw,rw,dsigma,rsigma)
%   NAVIEBILATERAL Summary of this function goes here
%   Detailed explanation goes here
%   radmapΪ�ն�ͼ��dw��dr�ֱ�Ϊ�����ֵ����˲�����С
%   dsigma��rsigma�ֱ�Ϊ�����ֵ��ĸ�˹sigma����
%   �������ɿ���ĸ�˹�˲���Ȩ������
[x,y] = meshgrid(-dw:dw,-dw:dw);
g1 = exp(-(x.^2+y.^2)/(2*dsigma^2));  

%   ��ͼ����жԳ����ţ���֤��ͼ��ı�Ե��Ȼ���Խ��д���   
pw = max(dw,rw);
padradMap = padarray(radMap,[pw pw],'symmetric');
dim = size(padradMap);
tonedMap = zeros(dim(1)-pw,dim(2)-pw);

for i= pw+1:dim(1)-pw
    for j=pw+1:dim(2)-pw
        I = padradMap(i-rw:i+rw,j-rw:j+rw);             %ȡ��Ӧͼ���
        g2 = exp(-(I-padradMap(i,j)).^2/(2*rsigma^2));  %ֵ���˲���������
        w = g1(:).*g2(:);                               %����˫������
        tonedMap(i-pw,j-pw) = sum(w.*I(:))/sum(w);      
    end
end

end
end

