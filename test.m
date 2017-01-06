% test
% testing of program
% for my own work

% house keeping
clear all;
clc;
tic;
% variables
numPointsInit = 5;
numBatteryLevels = 3;

% code
[G1, x1, y1] = graphMakingNew(numPointsInit);
[G1] = createEdgesFull(G1, numPointsInit);
[T, x3d, y3d, z3d] = tableMaking(x1, y1, numBatteryLevels);

% outputs
% figure(1)
% plot(G1)
figure(2)
plot(G1, 'XData', x1, 'YData', y1)

% creates 3D plots
figure(3)
h = scatter3(x3d, y3d, z3d);
numPoints = numel(h.XData);

% creates new graph with existing points
[G2, x2, y2] = graphMakingWPoints(h.XData, h.YData);
% [S1, T1, weights] = makingSTW(numPointsInit, numBatteryLevels);
[S1, T1, weights] = makingSTW(x2, y2, z3d, numPointsInit, numBatteryLevels);
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S1, T1);        % graph in cluster format

[G2] = createEdgesFull(G2, numPoints);
% [G2] = createEdges(G2, S1, T1, weights);
figure(4)
plot(G2, 'XData', x2, 'YData', y2);
[v_Adj, points] = makingV_adj(x2, y2, S1, T1, weights, 'directed');             % change to symetric or non-symetric based off of case
[v_Cluster] = makingV_cluster(numPointsInit, numBatteryLevels);
v_Cluster = num2cell(v_Cluster);                                                % formating
[v_Cluster, v_Adj] = createBaseStation(v_Cluster, v_Adj);


% GTSP solver
[x_reshape, G_final, fval, exitflag, output] = call_gtsp_recursive_func(v_Cluster, v_Adj);

% recreating GTSP solution on plot (UAV's tour)
[x3, y3] = createXYPoints(h.XData, h.YData);
[G3, x3, y3] = graphMakingWPoints(x3, y3);
figure(5);
% plot(G3, 'XData', x3, 'YData', y3)
[edgeArray, S2, T2] = createEdgeArray(x_reshape, numPointsInit, numBatteryLevels);
[G3] = createEdges(G3, S2, T2, G_final.Edges.Weight);
plot(G3, 'XData', x3, 'YData', y3, 'EdgeLabel', G_final.Edges.Weight)
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2);        % graphing the cluster format of the solution

% recreating GTSP solution on plot (UGV's tour)
% createUGVTour()


toc

