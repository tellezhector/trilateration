function [MI, IW] = filter_most_important_points(RP, W, n)
    sorted = sortrows([W, RP], -1);
    
    IW   =   sorted(1:n, 1);
    MI   =   sorted(1:n, 2:3);
endfunction