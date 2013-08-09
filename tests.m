P1 = [0 0];
P2 = [2 0];
r1 = 1;
r2 = 1;

I = find_intersections(P1, P2, r1, r2);
if (isequal(I, [1 0]))
	"+ Interseccion en un solo punto, funciona."
else
	"Se esperaba [1 0], pero se encontro:"
	printf("%d", I);
endif

r1 = sqrt(2);
r2 = sqrt(2);

I = find_intersections(P1, P2, r1, r2);
if (isequal(round(I), [1 -1; 1 1]))
	"+ Interseccion en dos puntos, funciona."
else
	"Se esperaba [1 -1; 1 1], pero se encontro:"
	printf("%f", I);
endif

r1 = 1;
r2 = 3;

I = find_intersections(P1, P2, r1, r2);
if (isequal(I, [-1 0]))
	"+ Interseccion en un punto donde un circulo contiene al otro, funciona."
else
	"Se esperaba [-1 0], pero se encontro:"
	printf("%f", I);
endif

r1 = .5;
r2 = .5;

I = find_intersections(P1, P2, r1, r2);
if (isequal(I, zeros(0, 0)))
	"+ Interseccion nula, funciona."
else
	"Se esperaba zeros(0, 0), pero se encontro:"
	printf("%f", I);
endif