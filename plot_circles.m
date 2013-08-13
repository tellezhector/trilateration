function void = plot_circles(P, Re)
    n = size(P, 1);

    for i = 1:n
        [x, y] = get_circle_points(P(i,:), Re(i));
        
        if (i == 1)
            X=x';
            Y=y';
            continue;
        endif
        X(:,i) = x';
        Y(:,i) = y';
    endfor
    
    plot(X,Y);
    axis([-200, 200, -200, 200], "square");
endfunction