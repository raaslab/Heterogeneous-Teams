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
xNew1 = [];
yNew1 = [];
xNew2 = [];
yNew2 = [];

for i = 1:totalPoints
    array(i) = i;
end

numEdges = numel(s);
indexEdgeNum1 = [];
sEnd1 = [];
tEnd1 = [];

for i = 1:numEdges
    if any(array(numLevels, :) == s(i)) && any(array(1, :) == t(i))
        word = 'yes';
        indexEdgeNum1(end+1) = i;
        sEnd1(end+1) = s(i);
        tEnd1(end+1) = t(i);
    end
end

tEnd1(end+1) = (numPoints * numLevels)+1;
tEnd1 = union(tEnd1, [], 'stable');
numOfNodesUsed = numel(tEnd1);

for i = 1:numOfNodesUsed
    xNew1(end+1) = x(tEnd1(i));
    yNew1(end+1) = y(tEnd1(i));
end


indexEdgeNum2 = [];
sEnd2 = [];
tEnd2 = [];
for i = 1:numEdges
    if any(array(numLevels, :) == t(i)) && any(array(1, :) == s(i))
        word = 'yes';
        indexEdgeNum2(end+1) = i;
        sEnd2(end+1) = t(i);
        tEnd2(end+1) = s(i);
    end
end

tEnd2(end+1) = (numPoints * numLevels)+1;
tEnd2 = union(tEnd2, [], 'stable');
numOfNodesUsed = numel(tEnd2);

for i = 1:numOfNodesUsed
    xNew2(end+1) = x(tEnd2(i));
    yNew2(end+1) = y(tEnd2(i));
end

if numel(tEnd2) > numel(tEnd1)
    indexNums = indexEdgeNum2;
    tourUGV = tEnd2;
    xNew = xNew2;
    yNew = yNew2;
else
    indexNums = indexEdgeNum1;
    tourUGV = tEnd1;
    xNew = xNew1;
    yNew = yNew1;
end

end

