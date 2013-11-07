function [MI, IW, RP] = most_important_points(P, Re, sigma)
	RP = relevant_points(P, Re, sigma);
	W = weights(RP, P, Re, sigma);
	[MI, IW] = filter_most_important_points(RP, W, size(P, 1));
endfunction