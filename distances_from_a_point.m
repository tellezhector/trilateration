function Dx = distances_from_a_point(P, x)
    quantity = size(P,1);
    Dx = zeros(quantity, 1);
    
    for i=1:quantity
        Dx(i,1) = distance(P(i,:), x);
    endfor
endfunction;