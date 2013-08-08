function intersections = find_intersections(P1, P2, Dxe1, Dxe2)
    d = distance(P1, P2);
    
    if(Dxe1+Dxe2 < d)
        intersections = zeros(0,0);
        return;
    endif
    
    error("Not implemented");
endfunction;