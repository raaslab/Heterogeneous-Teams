% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 7;
j = 3;
k = 1;
tTO = 2;
tL = 3;
rRate = 5;
UGVS = 1;
% location =  18;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
filename = ['testCase'];
[ansTime, problem] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS);
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem)];
time = [double(i), double(j), double(k), ansTime, double(problem)];