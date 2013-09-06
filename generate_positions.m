function P = generate_positions(number_of_positions, max_coordinate = 100)
    P = (rand(number_of_positions, 2) - 0.5)*2*max_coordinate;
endfunction;