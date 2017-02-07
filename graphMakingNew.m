% graphMaking
% makes a graph with random points
% INPUTS
% numPoints = number of points
% area = the value used to make the row x col random points
% OUTPUTS
% G = graph with points below
% x = array of x points
% y = array of y points

function [G, x, y] = graphMakingNew(numPoints, area)

x = [];
y = [];
% randomPoint = [];
G = graph;
for i = 1:numPoints
    randomPoint = randi(area,1,2);
    x(end+1) = randomPoint(:, 1);
    y(end+1) = randomPoint(:, 2);
    
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