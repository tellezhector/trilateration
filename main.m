n = 12;
printf("n = %d\n", n);
max_coordinate = 100;
printf("max_coordinate = %d\n", max_coordinate);
max_noise = 1;
printf("max_noise = %d\n", max_noise);

printf("------------------------------------\n\n");

printf("Generating aerials' positions.\n");
P = generate_positions(n, max_coordinate);

printf("Generating position to locate.\n");
x = generate_positions(1);

printf("Meassuring distances from point to locate.\n");
Rx = distances_from_a_point(P, x);

printf("Adding noise.\n");
Rxe = Rx + noise(n, max_noise);

printf("Generating random standard deviations")
sigmas = noise(n, max_noise) + 10;

printf("")
