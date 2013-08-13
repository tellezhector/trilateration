P1 = [0 0];
P2 = [2 0];
r1 = 1;
r2 = 1;

I = find_intersections(P1, P2, r1, r2);
assert(I, [1, 0]);
printf("+ Interseccion en un solo punto, funciona.\n");

r1 = sqrt(2);
r2 = sqrt(2);


I = find_intersections(P1, P2, r1, r2);
assert(round(I), [1 -1; 1 1]);
printf("+ Interseccion en dos puntos, funciona.\n");

r1 = 1;
r2 = 3;

I = find_intersections(P1, P2, r1, r2);
assert(I, [-1 0]);
printf("+ Interseccion en un punto donde un circulo contiene al otro, funciona.\n");

r1 = .5;
r2 = .5;

I = find_intersections(P1, P2, r1, r2);
assert(I, zeros(0, 0));
printf("+ Interseccion nula, funciona.\n");

r1 = .5;
r2 = .5;
