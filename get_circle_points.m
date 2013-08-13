function [x,y] = get_circle_points(P, r)
    t = linspace(0, 2*pi);
    x = cos(t)*r + P(1);
    y = sin(t)*r + P(2);
endfunction