function [P, x, R, sigma, Re] = random_data(n, max_coordinate, sigma_lower_bound, sigma_upper_bound)

	printf("Generating aerials' positions.\n");
	P = generate_positions(n, max_coordinate);

	printf("Generating position to locate.\n");
	x = generate_positions(1, max_coordinate);

	printf("Meassuring distances from point to locate.\n");
	R = distances_from_a_point(P, x);
	printf("Max distance: %f \n", max(R));
	printf("Min distance: %f \n", min(R));

	printf("Generating random standard deviations.\n");0
	sigma = sigma_lower_bound + rand(n, 1) * (sigma_upper_bound - sigma_lower_bound);
	printf("Max standard deviation: %f \n", max(sigma));
	printf("Mean standard deviation: %f \n", mean(sigma));
	printf("Min standard deviation: %f \n", min(sigma));

	printf("Adding gaussian noise.\n");
	Re = abs(add_gaussian_noise(R, sigma));
endfunction