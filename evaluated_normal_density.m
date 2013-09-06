function fx = evaluated_normal_density(x, mu=0, sigma=1)
	aux = (x-mu).^2;
	aux = aux./(2.*(sigma^2));
	aux = exp(-aux);
	aux = aux./(sigma*sqrt(2*pi));
	fx = aux;
endfunction