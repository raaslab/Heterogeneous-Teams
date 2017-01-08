% createUAVTour
% creates the correct UAV tour and plots it
% INPUTS
% x = GTSP points
% y = GTSP points that correspond to x
% s = starting node of edge output from GTSP
% t = end node of edge output from GTSP corresponding to s
% OUTPUTS
% x = simplified original points
% y = simplified original points that correspond to x

function [xNew, yNew, array] = createUAVTour(x, y, s, t)

array = union(s, t);
xNew = [];
yNew = [];
numOfNodesUsed = numel(array);

for i = 1:numOfNodesUsed
    xNew(end+1) = x(array(i));
    yNew(end+1) = y(array(i));
end


end

