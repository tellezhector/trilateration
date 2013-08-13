function [s1, s2] = segment(x, y)
    t = 0:0.01:1;
    s1 = x(1) + (y(1)-x(1))*t;
    s2 = x(2) + (y(2)-x(2))*t;
endfunction