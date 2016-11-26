% graphMakingWPoints
% INPUTS
% x = array of x corrdinates
% y = array of y corrdinates
% OUTPUTS
% G = graph
% x = x after duplicated
% y = y after duplicated


function [G, x, y] = graphMakingNew(x, y)

G = graph;
numPoints = numel(x);
G = addnode(G, numPoints);

% figure()
% plot(G, 'XData', x, 'YData', y)



end