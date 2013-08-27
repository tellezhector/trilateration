printf("------------------------------------\n");
printf("------------------------------------\n");
printf("------------------------------------\n");
printf("USED PARAMETERS\n\n");
n = 15;
max_coordinate = 100;

printf("n = %d (number of aerials)\n", n);
printf("max_coordinate = %d (map size is: 2*max_coordinate X 2*max_coordinate)\n", max_coordinate);

printf("------------------------------------\n");
printf("GENERATING RANDOM DATA\n\n");

printf("Generating aerials' positions.\n");
P = generate_positions(n, max_coordinate);

printf("Generating position to locate.\n");
x = generate_positions(1, max_coordinate);

printf("Meassuring distances from point to locate.\n");
R = distances_from_a_point(P, x);

printf("Generating random standard deviations.\n");
sigma = rand(n, 1)*50;

printf("Adding noise.\n");
Re = abs(add_gaussian_noise(R, sigma));

printf("------------------------------------\n");
printf("ALGORITHM STARTS\n\n");

printf("Getting relevant points.\n");
RP = relevant_points(P, Re, sigma);
printf("%d relevant points found.\n", size(RP, 1));

printf("Getting weights.\n");
W = weights(RP, P, Re, sigma);

printf("Filtering most important points.\n");
[MI, IW] = filter_most_important_points(RP, W, n);

printf("Getting position. \n");
y = get_position(IW, MI);

printf("------------------------------------\n\n");
printf("PLOTTING RESULTS.\n");

d = norm(x-y);
printf("Distance from real position: %f.\n", d);

[X,Y] = poinst_for_circles_plotting(P, Re);
[s1, s2] = segment(x, y);

plot(X, Y, "5", RP(:,1), RP(:,2), ".b", MI(:,1), MI(:,2), "or", x(1), x(2), "+", y(1), y(2), "x", s1, s2);
map_size = 4*max_coordinate;
axis([-map_size, map_size, -map_size, map_size], "square");
