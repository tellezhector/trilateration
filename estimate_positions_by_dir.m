function results = estimate_positions_by_dir(path)
    subdirs_info = dir(path);
    n = size(subdirs_info)(1);
    results = [];
    for i  = 1:n
        if(mod(i, 100) == 0)
            printf("%d subpaths analized in this directory so far.\n", i);
            disp(path);
            disp("-------");
        endif
        
        dir = subdirs_info(i).name;
        dir_path = [path, "/",  dir];
        is_file = !subdirs_info(i).isdir;
        if (is_file)
            [node_id, aerials, real_position, sigma_max, sigma_min, sigma_mean, estimate, dist, time, our_estimate, our_dist, our_time] = estimate_from_file(dir_path);
            results = [results; [node_id, aerials, real_position, sigma_max, sigma_min, sigma_mean, estimate, dist, time, our_estimate, our_dist, our_time]];
            continue;
        endif
        
        if (dir(1) == ".")
            continue;
        endif
        
        results = [results; estimate_positions_by_dir(dir_path)];
    endfor
endfunction