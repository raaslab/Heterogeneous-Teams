% totalCosts
% gets the total time cost of multiple runs
clear all;
sumTimes = [];
% for temp = 3
%     for z = 11
    G = 0;
    x = 0;
    y = 0;
    i = 20;
    j = 10;
    k = 1;
    tTO = 4;
    tL = 4;
    rRate = 0;
    UGVS = 1;
dname='/home/klyu/lab/Heterogeneous-Teams/MRS';
filename = [num2str(i) '_' num2str(j) 'GNLS.mat'];
fname=fullfile(dname,filename);
load(fname);
    G = 0;
    x = 0;
    y = 0;
    i = 20;
    j = 10;
    k = 1;
    tTO = 4;
    tL = 4;
    rRate = 0;
    UGVS = 1;
filename = [num2str(i) '_' num2str(j) 'GNLSmore.mat'];
fname=fullfile(dname,filename);
load(fname);
sumTimes(end+1) = calcTotalTimeUAVUGV(finalMatrix, roundedGtspMatrix)
%     end
% end



