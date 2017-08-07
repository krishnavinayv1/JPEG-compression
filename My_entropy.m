function [E] = My_entropy(im)
    probability = imhist(im)/numel(im);
    probability = probability(find(probability));
    sen=log2(probability);
    probability = -1*probability.*log2(probability);
    E = sum(probability);
    sen=probability;
end
