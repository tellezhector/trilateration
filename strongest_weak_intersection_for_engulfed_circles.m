function P = strongest_weak_intersection_for_engulfed_circles(P1, m1, sigma1, P2, m2, sigma2)
	if(m1 > m2)
        P = strongest_weak_intersection_for_engulfed_circles(P2, m2, sigma2, P1, m1, sigma1);
    endif
    
    [m, dm] = maximum_gaussians_product(0, sigma1, m2-m1, sigma2);
    
    difference = P2-P1;
    P = dm * difference;
    P = P / norm(difference);    
endfunction