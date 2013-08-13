function Re = add_gaussian_noise(mu, sigma)
	samples 	= 	100;
	n 			= 	size(mu, 1);
	u 			= 	rand(n, samples);
	mumat		= 	repmat(mu, 1, samples);
	sigmamat	=	repmat(sigma, 1, samples);
	quantiles	=	norminv(u, mumat, sigmamat);
	Re 			= 	sum(quantiles')'/samples;
endfunction;