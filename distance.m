function d = distance(v,w)
    difference  = v-w;
    squares_sum = dot(difference, difference);
    d = sqrt(squares_sum);
endfunction