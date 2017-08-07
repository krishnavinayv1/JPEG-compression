I = imread('LAKE.TIF');
c = 2;
matrix = [16 11 10 16 24 40 51 61;12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];
s = size(I,1);
s = s/8;
varr = ones([1,s]);
varr  = varr*8;
patchs = mat2cell(I,varr,varr);
var2=127;
temp_p = patchs;
value = numel(patchs)
for j = 1:value
F = dctmtx(8);
    var = patchs{j};
    imDCT = myDCT(var-var2,F);
    
    mdc_value = myDCT_quantization(imDCT,matrix,c);
    temp_p{j} = mdc_value;
end
temp_p = cell2mat(temp_p);
figure;
imshowpair(I,temp_p,'montage');
title(['c=',num2str(1)]);
