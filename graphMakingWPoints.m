% graphMakingWPoints
% INPUTS
% x = array of x corrdinates
% 
% OUTPUTS


function [G, x, y] = graphMakingNew(x, y)

G = graph;
numPoints = numel(x);
G = addnode(G, numPoints);

% figure()
% plot(G, 'XData', x, 'YData', y)



end