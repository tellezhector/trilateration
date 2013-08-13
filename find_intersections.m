function intersections = find_intersections(P1, P2, r1, r2)
    d = norm(P1-P2);
    
    if(r1+r2 < d)
        intersections = zeros(0);
        return;
    endif
    
    if(r1+d < r2)
        intersections = zeros(0);
        return;
    endif
    
    if(d+r2 < r1)
        intersections = zeros(0);
        return;
    endif
    
    middle = (P1 + P2) / 2;
	
	if(r1+r2 == d)
		intersections = middle; 
		return;
    endif

    c = norm(P1-P2); %# distance between circles' centers.

    cosAlpha = (r1^2+c^2-r2^2)/(2*r1*c);

    u_AB = (P2 - P1)/c; %# unit vector from first to second center.
    pu_AB = [u_AB(2), -u_AB(1)]; %# perpendicular vector to unit vector.

    sinAlpha = sqrt(1-cosAlpha^2);	
	base = P1 + u_AB * (r1*cosAlpha);
    
	if(sinAlpha == 0)
        intersections = base;
        return;
    endif
    
    intersect_1 = base + (pu_AB * r1 * sinAlpha);
    intersect_2 = base - (pu_AB * r1 * sinAlpha);
	
    intersections = [intersect_1; intersect_2];
endfunction;