% making STWGeneral
% this function will make v_Adj with the minimum type of edge between two
% points. There are 3 types of edges that can be use, but are constrained
% by certain properties
% INPUTS
% UGVSpeed = the time to travel one unit for the UGV (has to be greater than equal to 1)
% OUTPUTS


function [v_AdjNew, v_Type, sNew, tNew, weights] = makingSTWv_AdjGeneral(area, x, y, numPoints, numLevels, v_Cluster, timeTO, timeL, rechargeRate, UGVSpeed)

v_ClusterLevels = [];
for i = 1:numPoints
    for j = numLevels:-1:1
        v_ClusterLevels(end+1) = j;
    end
end
v_ClusterLevels = v_ClusterLevels';

% creating flying edges (only UAV and bat' < bat)
[type1, allDistances] = makingSTWType1(area, x, y, numPoints, numLevels, v_Cluster, v_ClusterLevels);

% creating charging edges (UAV riding UGV and charging/ bat' >= bat)
[type2] = makingSTWType2(numPoints, numLevels, type1, v_Cluster, timeTO, timeL, allDistances, v_ClusterLevels, rechargeRate, UGVSpeed);

% creating charge vertex edges (UAV flying to vertex and then charging on UGV at
% vertex/ bat' can be anything compared to bat)
[type3] = makingSTWType3(numPoints, numLevels, type1, v_Cluster, timeTO, timeL, allDistances, v_ClusterLevels, rechargeRate);

numOfTotalPoints = numPoints * numLevels;
numberOfEdges = numel(type1);
v_AdjNew(1:numOfTotalPoints, 1:numOfTotalPoints) = Inf;
v_Type(1:numOfTotalPoints, 1:numOfTotalPoints) = 0;

for i = 1:numberOfEdges
    compare = [type1(i), type2(i), type3(i)];
    [v_AdjNew(i), v_Type(i)]= min(compare);
end

for i = 1:numberOfEdges
    if v_AdjNew(i) == Inf
        v_AdjNew(i) = 0;
        v_Type(i) = 0;
    end
end

sNew = [];
tNew = [];
weights = [];
for i = 1:numOfTotalPoints
    for j = 1:numOfTotalPoints
        if v_AdjNew(i, j) ~= 0
            sNew(end+1) = i;
            tNew(end+1) = j;
            weights(end+1) = v_AdjNew(i, j);
        end
    end
end

end
