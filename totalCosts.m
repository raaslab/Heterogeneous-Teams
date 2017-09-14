% totalCosts
% gets the total time cost of multiple runs
clear all;
% sumTimes = [];
% for temp = 3
i = 18;
j = 4;
k = 1;
disp(k)
dname='/home/klyu/lab/heterogenous_teams/Heterogeneous-Teams/MRS';
filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(k) '.mat'];
fname=fullfile(dname,filename);
load(fname);
i = 18;
j = 4;
k = 1;
method = 1;
filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(k) 'more.mat'];
fname=fullfile(dname,filename);
load(fname);
sumTimes = calcTotalTimeUAVUGV(finalMatrix, roundedGtspMatrix, edgeWeightsFinal, method)
