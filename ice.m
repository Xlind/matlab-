function varargout = ice(varargin) 
ICE Interactive Color Editor. OUT = ICE('Property Name', 'Property Value', ...) transforms an image's color components based on interactively specified mapping functions. Inputs are Property Name/Property Value pairs:Name Value  
'image' An RGB or monochrome input image to be transformed by interactively specified mappings. 'space'  
The color space of the components to be modified. Possible values are 'rgb', 'cmy', 'hsi', 'hsv', 'ntsc' , 'yiq', 'ycbcr'  
When omitted, the RGB color space is assumed. 'wait' If 'on' (the default), 
OUT is the mapped input image and ICE returns to the calling function or workspace when closed. If 'off', OUT  
 but do not exceed 1. Scan the entire range.  
nudge = 1 / 256;  
for i = 2:size(in, 1) - 1  
if in(i, 1) <= in(i - 1, 1)  
in(i, 1) = min(in(i - 1, 1) + nudge, 1);  
end  
end  
 
Scan in reverse for non-unique x's and decrease the lower indexed x -- but don't go below 0. Stop on the first non-unique pair.  
if in(end, 1) == in(end - 1, 1)  
for i = size(in, 1):-1:2  
if in(i, 1) <= in(i - 1, 1)  
in(i - 1, 1) = max(in(i, 1) - nudge, 0);  
else  
break;  
end  
end  
end  
If the first two xs are now the same, init the curve.  
if in(1, 1) == in(2, 1)  
in = [0 0; 1 1];  
end  
out = in;  
function g = rgb2cmy(f)  
Convert RGB to CMY using IPTs imcomplement.  
g = imcomplement(f);  
end
function g = cmy2rgb(f)  
Convert CMY to RGB using IPTs imcomplement.  
g = imcomplement(f);  
end
end
