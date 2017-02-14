% making STWGeneral
% this function will make v_Adj with the minimum type of edge between two
% points. There are 3 types of edges that can be use, but are constrained
% by certain properties
% INPUTS

% OUTPUTS




function [sNew, tNew, weights, v_AdjNew] = makingSTWv_AdjGeneral(area, x, y, numPoints, numLevels, v_Cluster, timeTO, timeL, rechargeRate, UGVSpeed)

maxDistance = sqrt(area^2+area^2);
maxDistancePerLevel = maxDistance/numLevels;

v_ClusterLevels = [];
for i = 1:numPoints
    for j = numLevels:-1:1
        v_ClusterLevels(end+1) = j;
    end
end
v_ClusterLevels = v_ClusterLevels';

% creating flying edges (only UAV and bat' < bat)
[sNew, tNew, weights, type1, allDistances] =  makingSTWv_Adj(area, x, y, numPoints, numLevels, v_Cluster);
numberOfEdges = numel(type1);
for i = 1:numberOfEdges
    if type1(i) == 0
        type1(i) = Inf;
    end
end
% creating charging edges (UAV riding UGV and charging/ bat' >= bat)
[type2] = makingSTWType2(numPoints, numLevels, type1, v_Cluster, timeTO, timeL, allDistances, v_ClusterLevels, rechargeRate, UGVSpeed);

% creating charge vertex edges (UAV flying to vertex and then charging on UGV at
% vertex/ bat' can be anything compared to bat)
[type3] = makingSTWType3(numPoints, numLevels, type1, v_Cluster, timeTO, timeL, allDistances, v_ClusterLevels, rechargeRate);

numberOfEdges = numel(type1);
v_AdjNew = type1;
for i = 1:numberOfEdges
   v_AdjNew = min(type1(i), type2(i), type3(i)); 
end


end