function [RP, W] = find_relevant_points_with_weights(P, Re, sigma)
    n = size(P,1);
    RP = [0, 0];
    W = 0;
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
                case {"separated circles", "circle engulfed"}
                    I   = (P1+P2)/2;
                    d1  = norm(I-P1);
                    d2  = norm(I-P2);
                    w   = evaluated_normal_density(d1, r1, sigma1) * evaluated_normal_density(d2, r2, sigma2);

                case "two intersections"
                    w = evaluated_normal_density(r1, r1, sigma1) * evaluated_normal_density(r2, r2, sigma2);
                    w = [w; w];

                case "one intersection"
                    w = evaluated_normal_density(r1, r1, sigma1) * evaluated_normal_density(r2, r2, sigma2);
                    
                otherwise
                    printf("NOT SUPPORTED P1=(%f, %f), P2=(%f, %f), r1=%f, r2=%f. \n", P1(1), P1(2), P2(1), P2(2), r1, r2);
                    continue;
            endswitch
            
            RP = [RP; I];
            W = [W; w];
        endfor
    endfor

    W   =   W(2:size(W,1), :);
    RP  =   RP(2:size(RP,1), :);
endfunction;