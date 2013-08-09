function void = graph_normal(mu=0, sigma=1)
	x = [-10:.1:10];
	y = evaluated_normal_density(x, mu, sigma);
	plot(x,y);
endfunction