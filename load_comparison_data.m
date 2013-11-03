function [node_id, real_position, estimate, time, P, Re, sigma] = load_comparison_data(path)
	data = dlmread(path, " ");
	summary = data(1, :);
	aerials_data = data(2:end, :);
	
	real_position = summary(3:4);
	estimate = summary(5:6);
	time = summary(1);
    node_id = summary(2);
	
	P = aerials_data(:, 2:3);
	Re = aerials_data(:, 4);
	sigma = aerials_data(:, 5);
endfunction