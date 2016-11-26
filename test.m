% test
% testing of program
% for my own work

% house keeping
clear all;
clc;

% variables
numPointsInit = 3;
numBatteryLevels = 2;

% code
[G1, x1, y1] = graphMakingNew(numPointsInit);
[G1] = createEdges(G1, numPointsInit);
[T, x3d, y3d, z3d] = tableMaking(x1, y1, numBatteryLevels);

% outputs
% x
% y
% G
% G.Edges
%  figure(1)
%  plot(G)
figure(2)
plot(G1, 'XData', x1, 'YData', y1)
%  nodes = G1.Nodes
%  edges = G1.Edges
figure(3)
h = scatter3(x3d, y3d, z3d);
numPoints = numel(h.XData);
[G2, x2, y2] = graphMakingWPoints(h.XData, h.YData);
[G2] = createEdges(G2, numPoints);
figure(4)
plot(G2, 'XData', x2, 'YData', y2);




