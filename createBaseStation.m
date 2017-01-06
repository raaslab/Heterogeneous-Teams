% createBaseStation
% creates the start and end point for the tour (the base station) with edge
% cost close to zero
% INPUTS

% OUTPUTS


function [v_Cluster, v_Adj] = createBaseStation(v_Cluster, v_Adj)

clusterNum = max([v_Cluster{:}])+1;
v_Cluster(end+1) = {clusterNum};

v_Adj(:, end+1) = 0.00001;
v_Adj(end+1, :) = 0.00001;

end