% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 20;
j = 10;
k = 1;
tTO = 0;
tL = 0;
rRate = 30;
UGVS = 1;
% location =  18;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
filename = ['TO0L0RE30'];
[ansTime, problem] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y);
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem)];
time = [double(i), double(j), double(k), ansTime, double(problem)];