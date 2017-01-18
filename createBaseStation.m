% createBaseStation
% creates the start and end point for the tour (the base station) with edge
% cost close to zero
% INPUTS
% v_Cluster = v_Cluster for GTSP solver without base station
% v_Adj = v_Adj for GTSP solver without base station
% OUTPUTS
% v_Cluster = v_Cluster for GTSP solver with base station
% v_Adj = v_Adj for GTSP solver with base station

function [v_Cluster, v_Adj] = createBaseStation(v_Cluster, v_Adj, alpha, beta)

clusterNum = max([v_Cluster{:}])+1;
v_Cluster(end+1) = {clusterNum};

v_Adj(:, end+1) = alpha+beta;
v_Adj(end+1, :) = 0;
v_Adj(end) = -1;


end