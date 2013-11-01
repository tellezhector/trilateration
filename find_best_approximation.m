function [y, RP, MI] = find_best_approximation(P, Re, sigma)
	RP = relevant_points(P, Re, sigma);
	W = weights(RP, P, Re, sigma);
	[MI, IW] = filter_most_important_points(RP, W, size(P, 1));
	y = get_position(IW, MI);
endfunction