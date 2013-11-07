function void = plot_results(x, y, RP, MI, P, Re)
	d = norm(x-y);
	printf("Distance from real position: %f.\n", d);

	[X,Y] = poinst_for_circles_plotting(P, Re);
	[s1, s2] = segment(x, y);

	plot(X, Y, "5", RP(:,1), RP(:,2), ".b", MI(:,1), MI(:,2), "or", x(1), x(2), "+", y(1), y(2), "x", s1, s2);
	x_max = max(max(X)');
	x_min = min(min(X)');
	y_max = max(max(Y)');
	y_min = min(min(Y)');
	axis([x_min, x_max, y_min, y_max], "square");
endfunction