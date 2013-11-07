warning("off", "Octave:broadcast")

printf("------------------------------------\n");
printf("------------------------------------\n");
printf("------------------------------------\n");
printf("USED PARAMETERS\n\n");
n = 15;
sigma_lower_bound = 0;
sigma_upper_bound = 100;
max_coordinate = 100;

printf("n = %d (number of aerials)\n", n);
printf("max_coordinate = %d (map size is: 2*max_coordinate X 2*max_coordinate)\n", max_coordinate);
printf("Lower bound for standard deviation: %f \n", sigma_lower_bound);
printf("Upper bound for standard deviation: %f \n", sigma_upper_bound);

printf("------------------------------------\n\n");
printf("GENERATING RANDOM DATA\n\n");
[P, x, R, sigma, Re] = random_data(n, max_coordinate, sigma_lower_bound, sigma_upper_bound);

printf("------------------------------------\n\n");
printf("ALGORITHM STARTS\n\n");

[y, MI, RP] = find_best_approximation(P, Re, sigma);

printf("------------------------------------\n\n");
printf("PLOTTING RESULTS.\n");

plot_results(x, y, RP, MI, P, Re);

