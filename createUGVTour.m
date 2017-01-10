% createUGVTour
% this function creates the tour for the UGV, which is a subset of the tour
% created for the UAV. (GTSP solver output)
% INPUT
% x = GTSP points
% y = GTSP points that correspond to x
% s = starting node of an edge that corresponds with nodes in numerical
% order
% t = end of edge that corresponds with "s"
% numPoints = number of nodes in a graph
% numLevels = number of battery levels in a graph
% OUTPUT
% xNew = simplified original points
% yNew = simplified original points that correspond to x
% tourUGV = nodes for the UGV tour

function [xNew, yNew, tourUGV] = createUGVTour(x, y, s, t, numPoints, numLevels)

array = zeros(numLevels, numPoints);
totalPoints = numPoints * numLevels;
word = 'empty';
xNew = [];
yNew = [];

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

tEnd(end+1) = (numPoints * numLevels)+1;
tEnd = union(tEnd, [], 'stable');
numOfNodesUsed = numel(tEnd);

for i = 1:numOfNodesUsed
    xNew(end+1) = x(tEnd(i));
    yNew(end+1) = y(tEnd(i));
end


indexNums = indexEdgeNum;
tourUGV = tEnd;

end

