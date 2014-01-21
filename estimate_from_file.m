function [node_id, aerials, real_position, sigma_max, sigma_min, sigma_mean, estimate, dist, time, our_estimate, our_dist, our_time] = estimate_from_file(path)
	[node_id, real_position, estimate, time, P, Re, sigma] = load_comparison_data(path);
    tic;
	[our_estimate, RP, MI] = find_best_approximation(P, Re, sigma);
	our_time = toc;
    
    dist = norm(real_position - estimate);
    our_dist = norm(real_position - our_estimate);
    aerials = size(P, 1);
    sigma_max = max(sigma);
    sigma_min = min(sigma);
    sigma_mean = mean(sigma);
endfunction