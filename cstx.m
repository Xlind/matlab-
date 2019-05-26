% h = input('Adjust hue by: ');        % ����ɫ�ȵ�������h
% s = input('Adjust saturation by: ');        % ���뱥�Ͷȵ�������s
% v = input('Adjust intensity by: ');        % �������ȵ�������v
h = 5;       % ����ɫ�ȵ�������h
s = 10;        % ���뱥�Ͷȵ�������s
v = 5;        % �������ȵ�������v

I = imread('D:\photo\mymy.jpg');   % ��ȡԴͼ����ʾ
subplot(1,3,1),imshow(I),title('��ɫԭͼ��');
% HSV��ɫ�ռ䴦��
hsv_image = rgb2hsv(I);        % ��rgb��ɫ�ռ�ת��Ϊhsv��ɫ�ռ�
hue = hsv_image(:,:,1);        % ��ȡɫ��ͨ��
sat = hsv_image(:,:,2);        % ��ȡ���Ͷ�ͨ��
int = hsv_image(:,:,3);        % ��ȡ����ͨ��

hue = hue + 1 / 360 * h;    % �Ը�ͨ�����д���
sat = sat + 0.01 * s;
int = int + 0.01 * v;

hue(hue>1)=hue(hue>1) - 1; 
hue(hue<0)=1 - hue(hue<0);
hue(hue>1)=1; hue(hue<0)=0;
sat(sat>1)=1; sat(sat<0)=0;
int(int>1)=1; int(int<0)=0;

hsv_image(:,:,1) = hue;        % �����ĸ�ͨ������ԭͼ
hsv_image(:,:,2) = sat;
hsv_image(:,:,3) = int;

% matlab �޷�ֱ����ʾhsv��hsiͼ�񣬻�Ҫ��ת��Ϊrgb
rgb = hsv2rgb(hsv_image);    % ��hsv��ɫ�ռ�ת��Ϊrgb��ɫ�ռ䣬����ʾ
subplot(1,3,2),imshow(rgb),title('hsv��ɫ�ռ�ת��Ϊrgb��ɫ�ռ�');

% HSI��ɫ�ռ䴦��
hsi_image = rgb2hsi(I);        % ��rgb��ɫ�ռ�ת��Ϊhsi��ɫ�ռ�
hue = hsi_image(:,:,1);        % ��ȡɫ��ͨ��
sat = hsi_image(:,:,2);        % ��ȡ���Ͷ�ͨ��
int = hsi_image(:,:,3);        % ��ȡ����ͨ��

hue = hue + 1 / 360 * h;    % % �Ը�ͨ�����д���
sat = sat + 0.01 * s;
int = int + 0.01 * v;

hue(hue>1)=hue(hue>1) - 1; 
hue(hue<0)=1 - hue(hue<0);
hue(hue>1)=1; hue(hue<0)=0;
sat(sat>1)=1; sat(sat<0)=0;
int(int>1)=1; int(int<0)=0;

hsi_image(:,:,1) = hue;        % �����ĸ�ͨ������ԭͼ
hsi_image(:,:,2) = sat;
hsi_image(:,:,3) = int;

rgb = hsi2rgb(hsi_image);    % ��hsi��ɫ�ռ�ת��Ϊrgb��ɫ�ռ䣬����ʾ
subplot(1,3,3),imshow(rgb),title('hsi��ɫ�ռ�ת��Ϊrgb��ɫ�ռ�');

