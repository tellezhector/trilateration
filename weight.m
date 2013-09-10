function w = weight(rp, P, Re, sigma)
	Mi = norm(P - rp, 2, 'rows') - Re;
	w = prod(normpdf(0, Mi, sigma));
endfunction