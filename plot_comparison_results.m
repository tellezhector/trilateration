function void = plot_comparison_results(real_position, estimate1, estimate2, RP, MI, P, Re, t1, t2)
	d = norm(real_position - estimate1);
	printf("Distance from real position with this algorithm: %f.\n", d);
	printf("Time with this algorithm: %f.\n", t1);
    
	d = norm(real_position - estimate2);
	printf("Distance from real position with old algorithm: %f.\n", d);
	printf("Time with old algorithm: %f.\n", t2);
		
	[X,Y] = poinst_for_circles_plotting(P, Re);
	[s1, s2] = segment(real_position, estimate1);
	[s3, s4] = segment(real_position, estimate2);

	plot(X, Y, "5", RP(:,1), RP(:,2), ".b", MI(:,1), MI(:,2), "or", real_position(1), real_position(2), "+", estimate1(1), estimate1(2), "x", estimate2(1), estimate2(2), "rx", s1, s2, s3, s4);
	map_size = max(max(max(abs(X), abs(Y))));
	axis([-map_size, map_size, -map_size, map_size], "square");
endfunction