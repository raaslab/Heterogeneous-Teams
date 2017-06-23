% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 12;
j = 4;
k = 1;
tTO = 4;
tL = 4;
rRate = 0;
UGVS = 1;
% location =  975;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
filename = ['GNLS'];
[ansTime,gtspMatrix,gtspTime] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y);
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem2)];
% time = [double(i), double(j), double(k), ansTime, double(problem)];
roundedGtspMatrix = round(gtspMatrix);
roundedGtspMatrix(roundedGtspMatrix == -1) = 999999;