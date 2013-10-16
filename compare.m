function void = compare(file_name)
	u = dlmread(["data/", file_name], " ");
	result = u(1, :);
	data = u(2:end, :);
	
	x = result(3:4);
	z = result(5:6);
	their_time = u(1);
	
	P = data(:, 2:3);
	Re = data(:, 4);
	sigma = data(:, 5);
	
	printf("------------------------------------\n\n");
	printf("ALGORITHM STARTS.\n");

	tic;
	[y, RP, MI] = find_best_approximation(P, Re, sigma);
	our_time = toc;
	
	printf("------------------------------------\n\n");
	printf("PLOTTING RESULTS.\n");

	[X, Y] = plot_comparison_results(x, y, z, RP, MI, P, Re, our_time, their_time);
	printf("------------------------------------\n\n");
	printf("------------------------------------\n\n");

endfunction