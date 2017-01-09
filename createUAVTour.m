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

function [xNew, yNew, tourUAV] = createUAVTour(x, y, s, t)

tourUAV = union(s, t);
xNew = [];
yNew = [];
numOfNodesUsed = numel(tourUAV);

for i = 1:numOfNodesUsed
    xNew(end+1) = x(tourUAV(i));
    yNew(end+1) = y(tourUAV(i));
end


end

