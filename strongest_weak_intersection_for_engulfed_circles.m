function P = strongest_weak_intersection_for_engulfed_circles(P1, m1, sigma1, P2, m2, sigma2)
	if(m1 > m2)
        P = strongest_weak_intersection_for_engulfed_circles(P2, m2, sigma2, P1, m1, sigma1);
        return;
    endif
    
    difference = P1-P2;    
    [m, dm] = maximum_gaussians_product(0, sigma1, m2-(m1 + norm(difference)), sigma2);
    
    difference = P1-P2;
    P = (m1 + dm) * difference;
    P = P / norm(difference);
    P = P1 + P;
endfunction