function void = graph_gaussians_product(m1, sigma1, m2, sigma2)
	x = -100:0.01:100;
	
	y1 = evaluated_normal_density(x, m1, sigma1);
	y2 = evaluated_normal_density(x, m2, sigma2);
	y  = y1.*y2;

    plot(x, y1, "b", x, y2, "b", x, y, "r");
	max(y)
	x(y == max(y))
endfunction