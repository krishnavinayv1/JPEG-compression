function F = create_mat_dct()
F = zeros(8);
v=0;
    while v<7
        for u = 0:7
                if v == 0
                   r = sqrt(1/8);
                else
                   r = sqrt(2/8);
                end   
		sen=(cos(pi*(2*u+1)*v/(2*8)));
                F(v+1,u+1) = r*sen;
        end
	v=v+1;
    end 
end 
