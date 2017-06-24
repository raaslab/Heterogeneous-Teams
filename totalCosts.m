% totalCosts
% gets the total time cost of multiple runs

sumTimes = [];
for z = 1:10
    G = 0;
    x = 0;
    y = 0;
    i = 12;
    j = 7;
    k = 1;
    tTO = 4;
    tL = 4;
    rRate = 0;
    UGVS = 1;
    filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(z) '.mat'];
    load(filename);
    filename = [num2str(i) '_' num2str(j) 'GNLS' num2str(z) 'more.mat'];
    load(filename);
    sumTimes(end+1) = calcTotalTimeUAVUGV(finalMatrix, roundedGtspMatrix);
end




