% testGeneral
% testing of program
% for my own work
% INPUTS
% UGVSpeed = the absolute value of the UGV speed (has to be greater than equal to 1)
% OUTPUTS

% house keeping
% clear all;
% close all;
% clc;


function [time, problem1, problem2] = testGeneral(numPointsInit, numBatteryLevels, filename, timeTO, timeL, rechargeRate, UGVSpeed, G1, x1, y1)

tic;

% variables
% numPointsInit = 7;
% numBatteryLevels = 2;
area = 60; % value used for graphMakingNew for defining the random numbers created
nodeArray = [];

for i = 1:numPointsInit*numBatteryLevels
    nodeArray(end+1) = i;
end
nodeArray = nodeArray';

% code
[G1, x1, y1] = graphMakingNew(numPointsInit, area);
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
[v_Cluster] = makingV_cluster(numPointsInit, numBatteryLevels);
v_Cluster = num2cell(v_Cluster);                                                           % formating
% [S1, T1, weights] = makingSTW(numPointsInit, numBatteryLevels);
% [S1, T1, weights] = makingSTW(x2, y2, z3d, numPointsInit, numBatteryLevels);
% [S1, T1, weights, v_Adj] = makingSTWv_Adj(area, x1, y1, numPointsInit, numBatteryLevels, v_Cluster);
%-------------------------------------------------------------------------%
[v_Adj, v_Type, S1, T1, weights] = makingSTWv_AdjGeneral(area, x1, y1, numPointsInit, numBatteryLevels, v_Cluster, timeTO, timeL, rechargeRate, UGVSpeed);
%-------------------------------------------------------------------------%

[xOut, yOut] = graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S1, T1, 0, nodeArray);            % graph in cluster format

[G2] = createEdgesFull(G2, numPoints);
figure(4)
plot(G2, 'XData', x2, 'YData', y2);
% [v_Adj, points] = makingV_adj(x2, y2, S1, T1, weights, 'directed');                        % change to symetric or non-symetric based off of case
% [v_Cluster, v_Adj] = createBaseStation(v_Cluster, v_Adj);                                  % creates the base station for v_Adj and v_Cluster

% GTSP solver
% [x_reshape, G_final, fval, exitflag, output] = call_gtsp_recursive_func(v_Cluster, v_Adj);
[finalMatrix, G_init, edgeWeightsFinal, finalTour, problem1, problem2] = gtspSolver(v_Cluster, v_Adj, numPointsInit, numBatteryLevels, xOut, yOut);

% recreating GTSP solution on plot (UAV's tour)
[x3, y3] = createBaseStationPoint(h.XData, h.YData);                                       % creates the base station point
[edgeArray, S2, T2] = createEdgeArray(finalMatrix, numPointsInit, numBatteryLevels);
[x4, y4, nodeArrayUAV] = createUAVTour(x3, y3, S2, T2);
G3 = digraph;
[G3, x4, y4] = graphMakingWPoints(x4, y4, G3, nodeArrayUAV);
[G3] = createEdges(G3, edgeWeightsFinal(:, 1), edgeWeightsFinal(:, 2), edgeWeightsFinal(:, 3));
figure(5);
plot(G3, 'XData', x4, 'YData', y4, 'EdgeLabel', G3.Edges.Weight)
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2, 'yes', nodeArray);        % graphing the cluster format of the solution
title('UAV Tour');

% recreating GTSP solution on plot (UGV's tour)
[x5, y5, nodeArrayUGV] = createUGVTourTypes(x3, y3, finalTour, numPointsInit, numBatteryLevels, v_Type, finalMatrix);
G4 = digraph;
[G4, x5, y5] = graphMakingWPoints(x5, y5, G4, nodeArrayUGV);
[S3, T3] = makingUGVst(nodeArrayUGV);
[G4] = createEdges(G4, S3, T3);
figure(7);
plot(G4, 'XData', x5, 'YData', y5)
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S3, T3, 'yes', nodeArray);        % graphing the cluster format of the solution
title('UGV Tour');

% making x6 & y6
j = 0;
i = 0;
while i == 0
    x6 = circshift(x5, j);
    y6 = circshift(y5, j);
    if x6(end) == 0
        i = 1;
    else
        j = j+1;
    end
end

% making corrdinatesOfSites
locationOfZeroEdge = find(G3.Edges.Weight == 0);
numOfEdges = numel(G3.Edges.Weight);
startNode = G3.Edges.EndNodes(locationOfZeroEdge+numOfEdges);
% endNode = G3.Edges.EndNodes(locationOfZeroEdge)
corrdinatesOfSites = [];
for i = 1:numOfEdges
    indexNode = findnode(G3, startNode);
    corrdinatesOfSites(end+1, :) = [x4(indexNode), y4(indexNode)];
    for j = 1:numOfEdges
        locationOfEdge = findedge(G3, indexNode, j);
        if locationOfEdge ~= 0
            break;
        end
    end
    startNode = G3.Edges.EndNodes(locationOfEdge+numOfEdges);
    
end
corrdinatesOfSites = corrdinatesOfSites';
uavSites = 1:numPointsInit;

time = toc;
f = fullfile('/home/klyu/lab/Heterogeneous-Teams/systemPaper', filename);
save(f);
close all;
end

