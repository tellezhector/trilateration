parameters
random_data
printf("ALGORITHM STARTS\n\n");

error("NOT IMPLEMENTED");

printf("------------------------------------\n\n");
printf("PLOTTING RESULTS.\n");

d = norm(x-y);
printf("Distance from real position: %f.\n", d);

[X,Y] = poinst_for_circles_plotting(P, Re);
[s1, s2] = segment(x, y);

plot(X, Y, "5", RP(:,1), RP(:,2), ".b", MI(:,1), MI(:,2), "or", x(1), x(2), "+", y(1), y(2), "x", s1, s2);
map_size = 4*max_coordinate;
axis([-map_size, map_size, -map_size, map_size], "square");
