function intersections = find_intersections(P1, P2, r1, r2)
    d = norm(P1-P2);
    
    if(r1+r2 < d)
        intersections = zeros(0,0);
        return;
    endif

    middle = (P1 + P2) / 2;
    if(r1+r2 == d)
	intersections = middle; 
	return;
    endif

    A = P1; %# center of the first circle
    B = P2; %# center of the second circle
    a = r2; %# radius of the SECOND circle
    b = r1; %# radius of the FIRST circle
    c = norm(A-B); %# distance between circles

    cosAlpha = (b^2+c^2-a^2)/(2*b*c);

    u_AB = (B - A)/c; %# unit vector from first to second center
    pu_AB = [u_AB(2), -u_AB(1)]; %# perpendicular vector to unit vector

    %# use the cosine of alpha to calculate the length of the
    %# vector along and perpendicular to AB that leads to the
    %# intersection point
    sinAlpha = sqrt(1-cosAlpha^2);
    if(sinAlpha == 0)
        intersections = A + u_AB * (b*cosAlpha);
        return;
    endif
    
    intersect_1 = A + u_AB * (b*cosAlpha) + pu_AB * (b*sinAlpha);
    intersect_2 = A + u_AB * (b*cosAlpha) - pu_AB * (b*sinAlpha);

    intersections = [intersect_1; intersect_2];
endfunction;