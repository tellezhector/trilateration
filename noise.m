function e = noise(size = 1, max = 1)
    max = abs(max);
    e = (rand(size, 1)*2 - 1)*max;
endfunction;