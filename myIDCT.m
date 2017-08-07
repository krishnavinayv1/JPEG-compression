function [imIDCT] = myIDCT(im,Fs)
    sen = Fs\(double(im)*Fs);
	imIDCT=sen;
end
