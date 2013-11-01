function void = compare_and_plot(path)
	[real_position, estimate, time, P, Re, sigma] = load_comparison_data(path);
	
	printf("------------------------------------\n\n");
	printf("ALGORITHM STARTS.\n");

	tic;
	[our_estimate, RP, MI] = find_best_approximation(P, Re, sigma);
	our_time = toc;
	
	printf("------------------------------------\n\n");
	printf("PLOTTING RESULTS.\n");

	plot_comparison_results(real_position, our_estimate, estimate, RP, MI, P, Re, our_time, time);
	printf("------------------------------------\n\n");
	printf("------------------------------------\n\n");
endfunction