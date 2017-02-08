% runs mutliple tests to allow for plotting of a lot of runs
% the workspace should be stored after and then used for
% creatingTotalAverageTimes.m and specificRuns.m

% time = test(7, 3, filename)
tic
time = [];

for k = 1:1                     % number of runs
    for i = 5:3:20              % number of points
        for j = 3:5             % number of levels
            fileName = [num2str(i) '_' num2str(j) '_' num2str(k)];
            [ansTime, problem] = test(i, j, fileName);
            time(end+1, :) = [double(i), double(j), double(k), ansTime, double(problem)];
        end
    end
end

finaltime = toc;