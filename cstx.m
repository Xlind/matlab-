% h = input('Adjust hue by: ');        % 输入色度调整参数h
% s = input('Adjust saturation by: ');        % 输入饱和度调整参数s
% v = input('Adjust intensity by: ');        % 输入明度调整参数v
h = 5;       % 输入色度调整参数h
s = 10;        % 输入饱和度调整参数s
v = 5;        % 输入明度调整参数v

I = imread('D:\photo\mymy.jpg');   % 读取源图像并显示
subplot(1,3,1),imshow(I),title('彩色原图像');
% HSV颜色空间处理
hsv_image = rgb2hsv(I);        % 将rgb颜色空间转换为hsv颜色空间
hue = hsv_image(:,:,1);        % 提取色度通道
sat = hsv_image(:,:,2);        % 提取饱和度通道
int = hsv_image(:,:,3);        % 提取明度通道

hue = hue + 1 / 360 * h;    % 对各通道进行处理
sat = sat + 0.01 * s;
int = int + 0.01 * v;

hue(hue>1)=hue(hue>1) - 1; 
hue(hue<0)=1 - hue(hue<0);
hue(hue>1)=1; hue(hue<0)=0;
sat(sat>1)=1; sat(sat<0)=0;
int(int>1)=1; int(int<0)=0;

hsv_image(:,:,1) = hue;        % 运算后的各通道返回原图
hsv_image(:,:,2) = sat;
hsv_image(:,:,3) = int;

% matlab 无法直接显示hsv和hsi图像，还要先转换为rgb
rgb = hsv2rgb(hsv_image);    % 将hsv颜色空间转换为rgb颜色空间，并显示
subplot(1,3,2),imshow(rgb),title('hsv颜色空间转换为rgb颜色空间');

% HSI颜色空间处理
hsi_image = rgb2hsi(I);        % 将rgb颜色空间转换为hsi颜色空间
hue = hsi_image(:,:,1);        % 提取色度通道
sat = hsi_image(:,:,2);        % 提取饱和度通道
int = hsi_image(:,:,3);        % 提取明度通道

hue = hue + 1 / 360 * h;    % % 对各通道进行处理
sat = sat + 0.01 * s;
int = int + 0.01 * v;

hue(hue>1)=hue(hue>1) - 1; 
hue(hue<0)=1 - hue(hue<0);
hue(hue>1)=1; hue(hue<0)=0;
sat(sat>1)=1; sat(sat<0)=0;
int(int>1)=1; int(int<0)=0;

hsi_image(:,:,1) = hue;        % 运算后的各通道返回原图
hsi_image(:,:,2) = sat;
hsi_image(:,:,3) = int;

rgb = hsi2rgb(hsi_image);    % 将hsi颜色空间转换为rgb颜色空间，并显示
subplot(1,3,3),imshow(rgb),title('hsi颜色空间转换为rgb颜色空间');

