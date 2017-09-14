


function [sumTimes] = calcTotalTimeUAVUGV(finalMatrix, roundedGtspMatrix, edgeWeights, method)

switch method
    case 0
        sumTimes = 0;
        indexOfUsedPoints = find(finalMatrix==1);
        for i = 1:numel(indexOfUsedPoints)
            timeCost = roundedGtspMatrix(indexOfUsedPoints(i));
            sumTimes = sumTimes + timeCost;
        end
        
    case 1
        temp = cell2mat(edgeWeights(:,3));
        sumTimes = sum(temp);
        

end
end
