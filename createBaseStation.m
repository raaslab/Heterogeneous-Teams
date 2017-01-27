% createBaseStation
% creates the start and end point for the tour (the base station) with edge
% cost close to zero
% INPUTS
% v_Cluster = v_Cluster for GTSP solver without base station
% v_Adj = v_Adj for GTSP solver without base station
% alpha = allows for correct cost for base station
% beta = allows for correct cost for base station
% numPoints = number of nodes in a graph
% numLevels = number of battery levels in a graph
% OUTPUTS
% v_Cluster = v_Cluster for GTSP solver with base station
% v_Adj = v_Adj for GTSP solver with base station

function [v_Cluster, v_Adj] = createBaseStation(v_Cluster, v_Adj, alpha, beta, numPoints, numLevels)

clusterNum = max([v_Cluster{:}])+1;
v_Cluster(end+1) = {clusterNum};

v_Adj(end+1, :) = 0;
totalPoints = numPoints*numLevels;
tempCostArray = [];
for i = 1:totalPoints
    if mod(i, numLevels) == 1
        tempCostArray(end+1) = alpha+beta;
    else
        tempCostArray(end+1) = -1;
    end
end
tempCostArray(end+1) = -1;
v_Adj(:, end+1) = tempCostArray';



end