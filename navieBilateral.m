function [ tonedMap ] = navieBilateral( radMap,dw,rw,dsigma,rsigma)
%   NAVIEBILATERAL Summary of this function goes here
%   Detailed explanation goes here
%   radmap为照度图像，dw和dr分别为空域和值域的滤波器大小
%   dsigma和rsigma分别为空域和值域的高斯sigma因子
%   首先生成空域的高斯滤波器权重因子
[x,y] = meshgrid(-dw:dw,-dw:dw);
g1 = exp(-(x.^2+y.^2)/(2*dsigma^2));  

%   对图像进行对称扩张，保证在图像的边缘仍然可以进行处理   
pw = max(dw,rw);
padradMap = padarray(radMap,[pw pw],'symmetric');
dim = size(padradMap);
tonedMap = zeros(dim(1)-pw,dim(2)-pw);

for i= pw+1:dim(1)-pw
    for j=pw+1:dim(2)-pw
        I = padradMap(i-rw:i+rw,j-rw:j+rw);             %取相应图像块
        g2 = exp(-(I-padradMap(i,j)).^2/(2*rsigma^2));  %值域滤波因子生成
        w = g1(:).*g2(:);                               %生成双边因子
        tonedMap(i-pw,j-pw) = sum(w.*I(:))/sum(w);      
    end
end

end
end

