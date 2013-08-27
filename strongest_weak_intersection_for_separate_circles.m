function P =	strongest_weak_intersection_for_separate_circles(P1, m1, sigma1, P2, m2, sigma2)
	difference = P2 - P1;
    [m, dm] = maximum_gaussians_product(0, sigma1, norm(difference)-(m2 + m1), sigma2);
    
    P = (m1 + dm) * difference;
    P = P / norm(difference);
    P = P1 + P;
endfunction