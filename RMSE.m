function [y] = RMSE(image1,image2)
p=image1-image2
    x = sum(sum(p.^2));
    y = sqrt(x);
end
