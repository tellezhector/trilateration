function w = weight(rp, P, Re, sigma)
    w = 1;
    n = size(P, 1);
    for i = 1:n
        mi      = norm(P(i, :) - rp) - Re(i);
        w       = w * evaluated_normal_density(0, mi, sigma(i));
    endfor
endfunction