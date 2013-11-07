function y = get_position_approach_1(W, RP)
    weighted    =   RP .* [W W];
    y           =   sum(weighted, 1)/sum(W);
endfunction