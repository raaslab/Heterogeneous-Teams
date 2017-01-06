% createUGVTour
% this function creates the tour for the UGV, which is a subset of the tour
% created for the UAV. (GTSP solver output)
% INPUT
% s = starting node of an edge that corresponds with nodes in numerical
% order
% t = end of edge that corresponds with "s"
% numPoints = number of nodes in a graph
% numLevels = number of battery levels in a graph
% OUTPUT
% word = tells you if there was a charging edge found
% indexNums = index of the edge array that corresponds to an edge that
% charges
% edgeEnd = matrix that holds the edges


function [word, indexNums, edgeEnd, tourUGV] = createUGVTour(s, t, numPoints, numLevels)
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

edgeEnd = [sEnd; tEnd]';
indexNums = indexEdgeNum;
tourUGV = [tEnd];

end

