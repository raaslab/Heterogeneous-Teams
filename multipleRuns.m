% runs mutliple tests to allow for plotting of a lot of runs
% the workspace should be stored after and then used for
% creatingTotalAverageTimes.m and specificRuns.m

% time = test(7, 3, filename)
tic
time = [];
tTO = 4;
tL = 4;
rRate = 0;
UGVS = 8;
G = graph;
x = 0;
y = 0;

for k = 1:5                  % number of runs
    for i = 20:10:50              % number of points
        for j = 50:50:150             % number of levels
            filename1 = [num2str(tTO) num2str(tL) num2str(rRate) num2str(UGVS) '_' num2str(i) '_' num2str(j) '_' num2str(k)];
            % [ansTime, problem] = test(i, j, fileName);
            [ansTime, gtspMatrix, problem2] = testGeneral(i, j, filename1, tTO, tL, rRate, UGVS, G, x, y,1);
            roundedGtspMatrix = round(gtspMatrix);
            roundedGtspMatrix(roundedGtspMatrix == -1) = 999999;
            filename2 = ['/home/klyu/lab/heterogenous_teams/Heterogeneous-Teams/ICRA2018/multi_run/GLNS' filename1 '.gtsp'];
            createGTSPFile(filename2,roundedGtspMatrix, i, j)
            filename3 = [filename1 'extra'];
            f = fullfile('/home/klyu/lab/heterogenous_teams/Heterogeneous-Teams/ICRA2018/multi_run', filename3);
            save(f);
            time(end+1, :) = [double(i), double(j), double(k), ansTime];
            disp(k)
        end
    end
end

finaltime = toc;
filename4 = [num2str(tTO) num2str(tL) num2str(rRate) num2str(UGVS) '_' 'finalworkspace'];
f = fullfile('/home/klyu/lab/Heterogeneous-Teams/ICRA2018/multi_run', filename4);
save(f);