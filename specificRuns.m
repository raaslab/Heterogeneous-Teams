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
% ----------------------
allTimes = [];
% for z = 11
% z=11;
G = 0;
x = 0;
y = 0;
i = 100;         % number of sites
j = 100;          % number of battery levels
k = 1;
tTO = 4;        % take off cost
tL = 4;         % landing cost
rRate = 0;      % rate of recharge
UGVS = 4;       % time to travel one unit for the UGV
method = 1;     % 1 = GLNS, 0 = concorde
%     filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(z)];
%     filename = [num2str(i) '_' num2str(j) 'GNLS'];
filename = ['test40_40'];
[ansTime,gtspMatrix,gtspTime] = testGeneral(i, j, filename, tTO, tL, rRate, UGVS, G, x, y, method);
roundedGtspMatrix = round(gtspMatrix);
roundedGtspMatrix(roundedGtspMatrix == -1) = 999999;
% ---------------------------
%     filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(z) 'more'];
%     filename = [num2str(i) '_' num2str(j) 'GNLSmore'];
filename = ['test.gtsp'];
createGTSPFile(filename,roundedGtspMatrix, i, j)
filename = ['test'];
f = fullfile('/home/klyu/lab/Heterogeneous-Teams/ICRA2018', filename);
save(f);
%     filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(z) '.gtsp'];
%     filename = [num2str(i) '_' num2str(j) 'GNLS.gtsp'];
%     createGTSPFile(filename,roundedGtspMatrix)
%     clear all;
% end
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem2)];
% time = [double(i), double(j), double(k), ansTime, double(problem)];
% roundedGtspMatrix = round(gtspMatrix);
% roundedGtspMatrix(roundedGtspMatrix == -1) = 999999;
