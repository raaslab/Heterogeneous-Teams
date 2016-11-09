% graphMaking
% makes a graph with random points
% INPUTS
% numPoints = number of points
% OUTPUTS
% x = array of x points
% y = array of y points
% plot with those points

function [G, x, y] = graphMaking(numPoints)

x = [];
y = [];
G = graph;
for i = 1:numPoints
    [x(end+1), y(end+1)] = randomPoints(1,1,1);
end

% x
% y
G = addnode(G,numPoints);
% G
% G.Nodes
% G.Edges
% figure(3)
% plot(G, 'XData', x, 'YData', y)

end