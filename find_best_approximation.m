function [y, RP, MI] = find_best_approximation(P, Re, sigma)
	printf("Getting relevant points.\n");
	RP = relevant_points(P, Re, sigma);
	printf("%d relevant points found.\n", size(RP, 1));

	printf("Getting weights.\n");
	tic;
	W = weights(RP, P, Re, sigma);
	toc;

	printf("Filtering most important points.\n");
	[MI, IW] = filter_most_important_points(RP, W, size(P, 1));

	printf("Getting position. \n");
	y = get_position(IW, MI);
endfunction