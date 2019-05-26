function yuv = rgb2yuv(rgb)  
% yuv = rgb2yuv(rgb)把一幅RGB图像转换为YUV图像，  
% 输入图像是一个彩色像素的M×N×3的数组，  
% 其中每一个彩色像素都在特定空间位置的彩色图像中对应红、绿、蓝三个分量。  
% 假如所有的RGB分量是均衡的，那么HSI转换就是未定义的。  
% 输入图像可能是double（取值范围是[0, 1]），uint8或 uint16。  
%  
% 输出YUV图像是uint8。  
rgb = im2double(rgb);  
r = rgb(:, :, 1);  
g = rgb(:, :, 2);  
b = rgb(:, :, 3);  
  
% 执行转换函数  
y = 0.299*r + 0.587*g + 0.114*b;  
u = 0.567*(b - y);  
v = 0.713*(r - y);  
  
% 防止溢出  
if(y < 0)  
    y = 0;  
end;  
if(y > 1.0)  
    y = 1.0;  
end;  
if(u < 0)  
    u = 0;  
end;  
if(u > 1.0)  
    u = 1.0;  
end;  
if(v < 0)  
    v = 0;  
end;  
if(v > 1.0)  
    v = 1.0;  
end;  
      
% 联合yuv，并转成uint8类型  
y = y*255;  
u = u*255;  
v = v*255;  
yuv = cat(3, y, u, v);  
yuv = uint8(yuv);  
end

function rgb = yuv2rgb(yuv)  
% yuv = rgb2yuv(rgb)把一幅RGB图像转换为YUV图像，  
% 输入图像是一个彩色像素的M×N×3的数组，  
% 其中每一个彩色像素都在特定空间位置的彩色图像中对应红、绿、蓝三个分量。  
% 假如所有的RGB分量是均衡的，那么HSI转换就是未定义的。  
% 输入图像可能是double（取值范围是[0, 1]），uint8或 uint16。  
%  
% 输出YUV图像是uint8。  
yuv = im2double(yuv);  
y = yuv(:, :, 1);  
u = yuv(:, :, 2);  
v = yuv(:, :, 3);  
  
% 执行转换函数  
r = y + 1.402*v;  
g = y - 0.344*u - 0.714*v;  
b = y + 1.772*u;  
  
% 防止溢出  
if(r < 0)  
    r = 0;  
end;  
if(r > 1.0)  
    r = 1.0;  
end;  
if(g < 0)  
    g = 0;  
end;  
if(g > 1.0)  
    g = 1.0;  
end;  
if(b < 0)  
    b = 0;  
end;  
if(b > 1.0)  
    b = 1.0;  
end;  
      
% 联合rgb  
r = r*255;  
g = g*255;  
b = b*255;  
rgb = cat(3, r, g, b);  
rgb = uint8(rgb);
end