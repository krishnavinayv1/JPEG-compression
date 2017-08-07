function [imqDCT] = myDCT_quantization(imDCT,qm,c)
    temp=imDCT;
    imqDCT = temp;
	qm = qm*c;
        imqDCT = round(imqDCT./qm);
  end
