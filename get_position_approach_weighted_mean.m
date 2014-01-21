function y = get_position_approach_weighted_mean(W, MI)
    weighted    =   MI .* [W W];
    y           =   sum(weighted, 1)/sum(W);
endfunction