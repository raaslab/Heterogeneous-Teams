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
% graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S1, T1, 0);        % graph in cluster format

[G2] = createEdgesFull(G2, numPoints);
figure(4)
plot(G2, 'XData', x2, 'YData', y2);
[v_Adj, points] = makingV_adj(x2, y2, S1, T1, weights, 'directed');             % change to symetric or non-symetric based off of case
[v_Cluster] = makingV_cluster(numPointsInit, numBatteryLevels);
v_Cluster = num2cell(v_Cluster);                                                % formating
[v_Cluster, v_Adj] = createBaseStation(v_Cluster, v_Adj);                       % creates the base station for v_Adj and v_Cluster


% GTSP solver
[x_reshape, G_final, fval, exitflag, output] = call_gtsp_recursive_func(v_Cluster, v_Adj);

% recreating GTSP solution on plot (UAV's tour)
[x3, y3] = createBaseStationPoint(h.XData, h.YData);                            % creates the base station point
[edgeArray, S2, T2] = createEdgeArray(x_reshape, numPointsInit, numBatteryLevels);
[x4, y4, nodeArrayUAV] = createUAVTour(x3, y3, S2, T2);
G3 = digraph;
[G3, x4, y4] = graphMakingWPoints(x4, y4, G3, nodeArrayUAV);
figure(5);
[G3] = createEdges(G3, S2, T2, G_final.Edges.Weight);
plot(G3, 'XData', x4, 'YData', y4, 'EdgeLabel', G_final.Edges.Weight)
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2, 'yes');        % graphing the cluster format of the solution

% recreating GTSP solution on plot (UGV's tour)
% createUGVTour()


toc

