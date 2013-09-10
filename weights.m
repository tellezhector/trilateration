function W = weights(RP, P, Re, sigma)
    n = size(RP, 1);
    
    for i = 1:n
		w = weight(RP(i, :), P, Re, sigma);
        if (exist("W"))
            W = [W; w]; 
            continue;
        endif
        
        W = w;
    endfor
endfunction