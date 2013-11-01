function results = estimate_positions_by_dir_and_save(path);
    results = estimate_positions_by_dir(path);
    dlmwrite([path, ".results.txt"], results, " ");
endfunction