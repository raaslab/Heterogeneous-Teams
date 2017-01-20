% createUAVTour
% creates the correct UAV tour and plots it
% INPUTS
% x = GTSP points
% y = GTSP points that correspond to x
% s = starting node of edge output from GTSP
% t = end node of edge output from GTSP corresponding to s
% OUTPUTS
% xNew = simplified original points
% yNew = simplified original points that correspond to x
% tourUAV = nodes for the UAV tour

function [xNew, yNew, nodesVisited] = createUAVTour(x, y, s, t)

nodesVisited = union(s, t);
xNew = [];
yNew = [];
numOfNodesUsed = numel(nodesVisited);

for i = 1:numOfNodesUsed
    xNew(end+1) = x(nodesVisited(i));
    yNew(end+1) = y(nodesVisited(i));
end


end

