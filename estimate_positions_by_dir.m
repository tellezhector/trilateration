function results = estimate_positions_by_dir(path)
    subdirs_info = dir(path);
    n = size(subdirs_info)(1);
    results = [];
    for i  = 1:n
        dir = subdirs_info(i).name;
        disp(dir);
        is_file = !subdirs_info(i).isdir;
        if (is_file)
            [aerials, real_position, sigma_max, sigma_min, sigma_mean, estimate, dist, time, our_estimate, our_dist, our_time] = estimate_from_file([path, "/",  dir]);
            results = [results; [aerials, real_position, sigma_max, sigma_min, sigma_mean, estimate, dist, time, our_estimate, our_dist, our_time]];
            continue;
        endif
        
        if (dir(1) == ".")
            continue;
        endif
        
        results = [results; estimate_positions_by_dir([path, "/", dir])];
    endfor
endfunction