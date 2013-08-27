function RP = relevant_points(P, Re, sigma)
    n = size(P,1);
    RP = [0, 0];
    for i = 1:n
        for j = i+1:n
            P1      =   P(i,:);
            P2      =   P(j,:);
            r1      =   Re(i);
            r2      =   Re(j);
            sigma1  =   sigma(i);
            sigma2  =   sigma(j);
            [I, intersectionscase] = find_intersections(P1, P2, r1, r2);
            
            switch intersectionscase
                case "separated circles"
                    I   = strongest_weak_intersection_for_separate_circles(P1, r1, sigma1, P2, r2, sigma2);
	
				case "circle engulfed"
					I   = strongest_weak_intersection_for_engulfed_circles(P1, r1, sigma1, P2, r2, sigma2);
				
                case "two intersections"

                case "one intersection"
                  
                otherwise
                    printf("NOT SUPPORTED P1=(%f, %f), P2=(%f, %f), r1=%f, r2=%f. \n", P1(1), P1(2), P2(1), P2(2), r1, r2);
                    continue;
            endswitch
            
            RP = [RP; I];
        endfor
    endfor

    RP  =   RP(2:size(RP,1), :);
endfunction;