function y = get_position(P, Re, sigma)
    [W, RP]     =   find_relevant_points_with_weights(P, Re, sigma);
    weighted    =   RP .* [W W];
    y           =   sum(weighted)/sum(W);
endfunction