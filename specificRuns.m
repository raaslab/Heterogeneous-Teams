% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 20;
j = 10;
% k = 1;
tTO = 4;
tL = 4;
rRate = 4;
UGVS = 4;
% location =  18;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
filename = ['20_10_4_4_4_4'];
[ansTime, problem1, problem2] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y);
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem)];
% time = [double(i), double(j), double(k), ansTime, double(problem)];