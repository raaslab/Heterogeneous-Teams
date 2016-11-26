% test
% testing of program
% for my own work

% house keeping
clear all;
clc;

% variables
numPoints = 3;
numBatteryLevels = 2;

% code
[G, x, y] = graphMaking(numPoints);
[G] = createEdges(G, numPoints);
[T, x3d, y3d, z3d] = tableMaking(x, y, numBatteryLevels);

% outputs
% x
% y
% G
% G.Edges
%  figure(1)
%  plot(G)
 figure(2)
 plot(G, 'XData', x, 'YData', y)
 figure(3)
 h = scatter3(x3d, y3d, z3d)



