function [imDCT] = DCT(im,Fs)
    wel = (Fs*(double(im)))/Fs;
    imDCT=double(wel);
end
