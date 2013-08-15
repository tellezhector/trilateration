function y = get_position(W, RP)

    weighted    =   RP .* [W W];
    y           =   sum(weighted)/sum(W);
endfunction