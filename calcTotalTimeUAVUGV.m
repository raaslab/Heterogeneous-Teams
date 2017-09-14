% calcTotalTimeUAVUGV


function [sumTimes] = calcTotalTimeUAVUGV(finalMatrix, roundedGtspMatrix)
sumTimes = 0;
indexOfUsedPoints = find(finalMatrix==1);
for i = 1:numel(indexOfUsedPoints)
    timeCost = roundedGtspMatrix(indexOfUsedPoints(i));
    sumTimes = sumTimes + timeCost;
end
end

