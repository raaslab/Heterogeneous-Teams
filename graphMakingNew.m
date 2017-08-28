% graphMaking
% makes a graph with random points
% INPUTS
% numPoints = number of points
% area = array of [xmax, xmin, ymax, ymin]
% OUTPUTS
% G = graph with points below
% x = array of x points
% y = array of y points

function [G, x, y, xo, yo] = graphMakingNew(numPoints, area, rotation)

% x = [];
% y = [];
% randomPoint = [];
G = graph;
% for i = 1:numPoints
%     randomPoint = randi(area,1,2);
%     x(end+1) = randomPoint(:, 1);
%     y(end+1) = randomPoint(:, 2);
%     
% end

% x = randperm(area, numPoints);
% y = randperm(area, numPoints);

xo = (rand(1,numPoints)*(area(1)-area(2)))+area(2);
yo = (rand(1,numPoints)*(area(3)-area(4)))+area(4);
originalPoints = [xo;yo;zeros(1,numPoints)];
rotatedPoints = rotatePoints(originalPoints, rotation);
x = rotatedPoints(1,:);
y = rotatedPoints(2,:);

% x
% y
G = addnode(G, numPoints);
% G
% G.Nodes
% G.Edges
% figure(3)
% plot(G, 'XData', x, 'YData', y)

end