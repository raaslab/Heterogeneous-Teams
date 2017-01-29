% runs mutliple tests to allow for plotting of a lot of runs

% time = test(7, 3, filename)
time = [];

for k = 1:5                     % number of runs
    for i = 5:3:20              % number of points
        for j = 3:6             % number of levels
            filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
            ansTime = test(i, j, filename);
            time(end+1) = ansTime;
        end
    end
end
