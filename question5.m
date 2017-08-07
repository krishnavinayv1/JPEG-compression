I = imread('LAKE.TIF');
qm = [16 11 10 16 24 40 51 61;12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];
s = size(I,1);
s = s/8;
varr = ones([1,s]);
varr  = varr*8;
patchs = mat2cell(I,varr,varr);
ll = 1:10;
var=127;
F = dctmtx(8);
for c = ll
    temp_p = cell(size(patchs));
    value = numel(patchs);
    for i = 1:value
        var1 = patchs{i};
        DCT = myDCT(var1-var,F);
        qDCT = myDCT_quantization(DCT,qm,c);
        dqDCT = myDCT_dequantization(qDCT,qm,c);
        var3 = myIDCT(dqDCT,F);
        temp_p{i} = var3 + var;
    end
    temp_p = cell2mat(temp_p);
  
    entro(c) = My_entropy(uint8(temp_p));
    rmserror(c) = RMSE(double(I),double(temp_p));
end
plot(entro,rmserror,'.');
