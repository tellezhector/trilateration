function [MI, IW] = filter_most_important_points(RP, W, n)
    sorted = sortrows([W, RP], -1);
    m = min(n, size(sorted,1));
    
    IW   =   sorted(1:m, 1);
    MI   =   sorted(1:m, 2:3);
endfunction