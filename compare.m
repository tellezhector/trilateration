function void = compare(path)
	data = dlmread([path], " ");
	result = data(1, :);
	aerials_data = data(2:end, :);
	
	real_position = result(3:4);
	z = result(5:6);
	time = data(1);
	
	P = aerials_data(:, 2:3);
	Re = aerials_data(:, 4);
	sigma = aerials_data(:, 5);
	
	printf("------------------------------------\n\n");
	printf("ALGORITHM STARTS.\n");

	tic;
	[y, RP, MI] = find_best_approximation(P, Re, sigma);
	our_time = toc;
	
	printf("------------------------------------\n\n");
	printf("PLOTTING RESULTS.\n");

	plot_comparison_results(real_position, y, z, RP, MI, P, Re, our_time, time);
	printf("------------------------------------\n\n");
	printf("------------------------------------\n\n");
endfunction