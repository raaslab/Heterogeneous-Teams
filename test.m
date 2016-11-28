% test
% testing of program
% for my own work

% house keeping
clear all;
clc;
tic;
% variables
numPointsInit = 5;
numBatteryLevels = 6;

% code
[G1, x1, y1] = graphMakingNew(numPointsInit);
[G1] = createEdgesFull(G1, numPointsInit);
[T, x3d, y3d, z3d] = tableMaking(x1, y1, numBatteryLevels);

% outputs
% x
% y
% G
% G.Edges
%  figure(1)
%  plot(G)
% figure(2)
% plot(G1, 'XData', x1, 'YData', y1)
%  nodes = G1.Nodes
%  edges = G1.Edges
% figure(3)
h = scatter3(x3d, y3d, z3d);
numPoints = numel(h.XData);
[G2, x2, y2] = graphMakingWPoints(h.XData, h.YData);
[G2] = createEdgesFull(G2, numPoints);
% figure(4)
% plot(G2, 'XData', x2, 'YData', y2);
[V_adj, points] = makingV_adj(x2, y2);
[V_Cluster] = makingV_Cluster(numPointsInit, numBatteryLevels);
V_Cluster = num2cell(V_Cluster);
[x_reshape, G_final,fval,exitflag,output] = call_gtsp_recursive_func(V_Cluster, V_adj);


[G3, x3, y3] = graphMakingWPoints(h.XData, h.YData);
figure(1)
plot(G3, 'XData', x3, 'YData', y3)
[edgeArray, S, T] = createEdgeArray(x_reshape);
[G3] = createEdges(G3, edgeArray, S, T)
plot(G3, 'XData', x3, 'YData', y3)

toc

