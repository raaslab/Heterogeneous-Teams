% runs mutliple tests to allow for plotting of a lot of runs
% the workspace should be stored after and then used for
% creatingTotalAverageTimes.m and specificRuns.m

% time = test(7, 3, filename)
tic
time = [];
tTO = 0;
tL = 0;
rRate = 0;
UGVS = 1;
G = graph;
x = 0;
y = 0;

for k = 1:100                  % number of runs
    for i = 10:5:50              % number of points
        for j = 10:10:30             % number of levels
            fileName = [num2str(i) '_' num2str(j) '_' num2str(k)];
            % [ansTime, problem] = test(i, j, fileName);
            [ansTime, problem1, problem2] = testGeneral(i, j, fileName, tTO, tL, rRate, UGVS, G, x, y);
            time(end+1, :) = [double(i), double(j), double(k), ansTime, double(problem2)];
        end
    end
end

finaltime = toc;
filename = 'finalworkspace';
f = fullfile('/home/klyu/Heterogeneous-Teams/answers', filename);
save(f);