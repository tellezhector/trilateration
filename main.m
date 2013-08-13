n = 15;
printf("n = %d\n", n);
max_coordinate = 100;
printf("max_coordinate = %d\n", max_coordinate);

printf("------------------------------------\n\n");

printf("Generating aerials' positions.\n");
P = generate_positions(n, max_coordinate);

printf("Generating position to locate.\n");
x = generate_positions(1);

printf("Meassuring distances from point to locate.\n");
R = distances_from_a_point(P, x);

printf("Generating random standard deviations.\n");
sigma = rand(n, 1)*0.1;

printf("Adding noise.\n");
Re = R + normrnd(R, sigma);

printf("Getting position. \n");
y = get_position(P, Re, sigma);

d = norm(x-y);
printf("Distance %f.\n", d);

printf("------------------------------------\n\n");

printf("Plotting.\n");
[X,Y] = poinst_for_circles_plotting(P, Re);
[s1, s2] = segment(x, y);

plot(X, Y, P(:,1), P(:,2), ".", x(1), x(2), "+", y(1), y(2), "x", s1, s2);
axis([-400, 400, -400, 400], "square");
