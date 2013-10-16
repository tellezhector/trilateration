printf("------------------------------------\n\n");
printf("ALGORITHM STARTS.\n");

[y, RP, MI] = find_best_approximation(P, Re, sigma);

printf("------------------------------------\n\n");
printf("PLOTTING RESULTS.\n");

[X, Y] = plot_comparison_results(x, y, z, RP, MI, P, Re);
printf("------------------------------------\n\n");
printf("------------------------------------\n\n");
