image = imread('LAKE.TIF');
kk = [420 45;427 298;30 230];
F = dctmtx(8);
j=1;
ert = size(kk,1)
qm = [16 11 10 16 24 40 51 61;12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];

while j <= ert
    j2 = kk(j,2);
    if(j==1)
	j1 = 420
        end
    if(j==2)
        j1=427
        end
    if(j==3)
        j1=30
         end
var4 = 127
    im = image(j1:(j1+7),j2:(j2+7))
    var = im - var4
    DCT = myDCT(var,F)
    var1 = 2
    qDCT = myDCT_quantization(DCT,qm,var1)
    var2 = 127
    dqDCT = myDCT_dequantization(qDCT,qm,var1);
    reconstructed = myIDCT(dqDCT,F)+ var2
     figure;
    subplot(1,2,1);
    imshow(uint8(image));
    title(j);
    subplot(1,2,2);
    imshow(uint8(reconstructed));
    title(j);
    j=j+1
    error = RMSE(double(im),double(reconstructed))
end
