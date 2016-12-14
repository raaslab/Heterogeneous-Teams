% graphMakingWPoints
% 2 inputs: creates a directional graph
% 3 inputs: addes the points to an already existing graph
% INPUTS
% x = array of x corrdinates
% y = array of y corrdinates
% G = if there is a graph already made you want to add the points too.
% OUTPUTS
% G = graph
% x = x after duplicated
% y = y after duplicated


function [G, x, y] = graphMakingWPoints(x, y, G)

switch nargin
    case 3
        numPoints = numel(x);
        G = addnode(G, numPoints);
    case 2
        G = digraph;
        numPoints = numel(x);
        G = addnode(G, numPoints);
end

% figure()
% plot(G, 'XData', x, 'YData', y)



end