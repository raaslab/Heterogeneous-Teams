% specificRuns
% this will run a specific case for if there's an error within "time"
% variable


% G = 0;
% x = 0;
% y = 0;
% i = 12;
% j = 4;
% k = 1;
% tTO = 4;
% tL = 4;
% rRate = 0;
% UGVS = 1;
% location =  975;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
% filename = ['GNLS'];
for z = 1:10
    G = 0;
    x = 0;
    y = 0;
    i = 18;
    j = 4;
    k = 1;
    tTO = 4;
    tL = 4;
    rRate = 0;
    UGVS = 1;
    filename = ['GNLS' num2str(z)];
    [ansTime,gtspMatrix,gtspTime] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y);
    roundedGtspMatrix = round(gtspMatrix);
    roundedGtspMatrix(roundedGtspMatrix == -1) = 999999;
    filename = ['GNLS' num2str(z) 'more'];
    f = fullfile('/home/klyu/lab/Heterogeneous-Teams/MRS', filename);
    save(f);
    clear all;
end
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem2)];
% time = [double(i), double(j), double(k), ansTime, double(problem)];
% roundedGtspMatrix = round(gtspMatrix);
% roundedGtspMatrix(roundedGtspMatrix == -1) = 999999;