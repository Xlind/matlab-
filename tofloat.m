function [out,revertclass] = tofloat(inputimage)
%Copy the book of Gonzales
identify = @(x) x;
tosingle = @im2single;
table = {'uint8',tosingle,@im2uint8 
         'uint16',tosingle,@im2uint16 
         'logical',tosingle,@logical
         'double',identify,identify
         'single',identify,identify};
classIndex = find(strcmp(class(inputimage),table(:,1)));
if isempty(classIndex)
    error('不支持的图像类型');
end
out = table{classIndex,2}(inputimage);
revertclass = table{classIndex,3};
end
