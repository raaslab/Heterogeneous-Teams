% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 9;
j = 4;
k = 1;
tTO = 50;
tL = 50;
rRate = 0;
UGVS = 1;
% location =  18;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
filename = ['505001'];
[ansTime, problem] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y);
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem)];
time = [double(i), double(j), double(k), ansTime, double(problem)];