image = imread('LAKE.TIF');
var3 = 127;
matrix = [16 11 10 16 24 40 51 61;12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];
s = size(image,1);
s = s/8;
varr = ones([1,s]);
varr  = varr*8;
patchs = mat2cell(image,varr,varr);
kk = 1:10;
F = dctmtx(8);
for c = kk
    F = dctmtx(8);
    temp_patchs = patchs;
    value = numel(patchs)
    for j = 1:value
        var1 = patchs{j};
        DCT = myDCT(var1-var3,F);
        qDCT = myDCT_quantization(DCT,matrix,c);
        dqDCT = myDCT_dequantization(qDCT,matrix,c);
        myidct_value = myIDCT(dqDCT,F);
        temp_patchs{j} = myidct_value+var3;
    end
    temp_patchs = cell2mat(temp_patchs);
    figure;
    imshowpair(image,temp_patchs,'montage');
    title(['c=',num2str(c)]);
    
end
