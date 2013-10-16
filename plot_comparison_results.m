function [X, Y] = plot_comparison_results(real, y, z, RP, MI, P, Re, t1, t2)
	d = norm(real - y);
	printf("Distance from real position with this algorithm: %f.\n", d);
	printf("Time with this algorithm: %f.\n", t1);
    
	d = norm(real - z);
	printf("Distance from real position with old algorithm: %f.\n", d);
	printf("Time with old algorithm: %f.\n", t2);
		
	[X,Y] = poinst_for_circles_plotting(P, Re);
	[s1, s2] = segment(real, y);
	[s3, s4] = segment(real, z);

	plot(X, Y, "5", RP(:,1), RP(:,2), ".b", MI(:,1), MI(:,2), "or", real(1), real(2), "+", y(1), y(2), "x", z(1), z(2), "rx", s1, s2, s3, s4);
	map_size = max(max(max(abs(X), abs(Y))));
	axis([-map_size, map_size, -map_size, map_size], "square");
endfunction