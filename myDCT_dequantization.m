function [imDCT] = myDCT_dequantization(imDCT,qm,c)
    qm = qm.*c;
    tmep = imDCT.*qm;
    imDCT=tmep;
end
