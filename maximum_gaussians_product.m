function [M, dm] = maximum_gaussians_product(m1, sigma1, m2, sigma2)
	if (m1 > m2)
       [M, dm] = maximum_gaussinas_product(m2, sigma2, m1, sigma1);
       dm = -dm;
       return;
	endif
	
	epsilon = ((m2 + sigma2) - (m1 - sigma1))/1000;
	x = m1-sigma1:epsilon:m2+sigma2;
	y1 = evaluated_normal_density(x, m1, sigma1);
	y2 = evaluated_normal_density(x, m2, sigma2);
	y  = y1 .* y2;
	M  = max(y);
	Mx = x(y==M);
	dm = Mx;
endfunction