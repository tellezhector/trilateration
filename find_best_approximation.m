function [y, MI, RP] = find_best_approximation(P, Re, sigma)
	[MI, IW, RP] = most_important_points(P, Re, sigma);
	y = get_position_approach_weighted_mean(IW, MI);
endfunction