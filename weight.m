function w = weight(rp, P, Re, sigma)
    rpm = repmat(rp, size(P, 1), 1);
	Mi = norm(P - rpm, 2, 'rows') - Re;
	w = prod(normpdf(0, Mi, sigma));
endfunction