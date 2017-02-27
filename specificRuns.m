% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 16;
j = 9;
k = 9;
tTO = 0;
tL = 0;
rRate = 0;
UGVS = 1;
location =  975;
filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
% filename = ['20_10_4_4_4_4'];
[ansTime, problem2] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y);
time(location, :) = [double(i), double(j), double(k), ansTime, double(problem2)];
% time = [double(i), double(j), double(k), ansTime, double(problem)];