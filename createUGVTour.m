% createUGVTour
% this function creates the tour for the UGV, which is a subset of the tour
% created for the UAV. (GTSP solver output)
% INPUT

% OUTPUT


function [array, word, indexNums, sEnd, tEnd] = createUGVTour(s, t, numPoints, numLevels)
array = zeros(numLevels, numPoints);
totalPoints = numPoints * numLevels;
word = 'empty';

for i = 1:totalPoints
    array(i) = i;
end

numEdges = numel(s);
indexEdgeNum = [];
sEnd = [];
tEnd = [];

for i = 1:numEdges
    if any(array(3, :) == s(i)) && any(array(1, :) == t(i))
        word = 'yes';
        indexEdgeNum(end+1) = i;
        sEnd(end+1) = s(i);
        tEnd(end+1) = t(i);
    end
end

indexNums = indexEdgeNum;

end

