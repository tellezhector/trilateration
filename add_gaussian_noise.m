function Re = add_gaussian_noise(mu, sigma)
	n	= size(mu, 1);
	u	= rand(n, 1);
	Re	= norminv(u, mu, sigma);
endfunction;