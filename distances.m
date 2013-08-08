function D = distances(P)
    quantity = size(P,1);
    D = zeros(quantity);
    
    for i = 1:quantity
        for j = 1:quantity
            if(i == j)
                continue;
            endif
            
            if(D(j,i) != 0)
                D(i,j) = D(j,i);
                continue;
            endif
            
            D(i,j) = distance(P(i,:), P(j,:));
        endfor
    endfor
endfunction;