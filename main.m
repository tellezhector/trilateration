n = 15;
max_coordinate = 100;

printf("n = %d\n", n);
printf("max_coordinate = %d\n", max_coordinate);

printf("------------------------------------\n\n");

printf("Generating aerials' positions.\n");
P = generate_positions(n, max_coordinate);

printf("Generating position to locate.\n");
x = generate_positions(1, max_coordinate);

printf("Meassuring distances from point to locate.\n");
R = distances_from_a_point(P, x);

printf("Generating random standard deviations.\n");
sigma = rand(n, 1)*50;

printf("Adding noise.\n");
Re = add_gaussian_noise(R, sigma);

printf("Getting relevant points and weights.\n");
[RP, W] = find_relevant_points_with_weights(P, Re, sigma);

printf("Filtering most important points.\n");
[MI, IW] = filter_most_important_points(RP, W, n);

printf("Getting position. \n");
y = get_position(IW, MI);

d = norm(x-y);
printf("Distance %f.\n", d);

printf("------------------------------------\n\n");

printf("Plotting.\n");
[X,Y] = poinst_for_circles_plotting(P, Re);
[s1, s2] = segment(x, y);

plot(X, Y, MI(:,1), MI(:,2), ".b", x(1), x(2), "+", y(1), y(2), "x", s1, s2);
axis([-400, 400, -400, 400], "square");
