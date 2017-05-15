% runs mutliple tests to allow for plotting of a lot of runs
% the workspace should be stored after and then used for
% creatingTotalAverageTimes.m and specificRuns.m

% time = test(7, 3, filename)
tic
time = [];
tTO = 4;
tL = 4;
rRate = 0;
UGVS = 2;
G = graph;
x = 0;
y = 0;

for k = 1:5                  % number of runs
    for i = 12              % number of points
        for j = 4             % number of levels
            fileName = [num2str(tTO) num2str(tL) num2str(rRate) num2str(UGVS) '_' num2str(i) '_' num2str(j) '_' num2str(k)];
            % [ansTime, problem] = test(i, j, fileName);
            [ansTime, problem1, problem2] = testGeneral(i, j, fileName, tTO, tL, rRate, UGVS, G, x, y);
            time(end+1, :) = [double(i), double(j), double(k), ansTime];
        end
    end
end

finaltime = toc;
filename = [num2str(tTO) num2str(tL) num2str(rRate) num2str(UGVS) '_' 'finalworkspace'];
f = fullfile('/home/klyu/gitRepos/Heterogeneous-Teams/systemPaper', filename);
    save(f);