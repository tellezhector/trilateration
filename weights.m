function W = weights(RP, P, Re, sigma)
    n = size(RP, 1);
    
    for i = 1:n
        if (exist("W"))
            W = [W; weight(RP(i, :), P, Re, sigma)]; 
            continue;
        endif
        
        W = weight(RP(i, :), P, Re, sigma);
    endfor
endfunction