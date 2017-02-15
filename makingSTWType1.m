% makingSTWType1
% this will make a v_Adj with only UAV flights on it
% INPUTS

% OUTPUTS


function [v_AdjNew, distances] = makingSTWType1(area, x, y, numPoints, numLevels, v_Cluster, v_ClusterLevel)

[sNew, tNew, weights, v_AdjNew, distances] =  makingSTWv_Adj(area, x, y, numPoints, numLevels, v_Cluster);
numberOfEdges = numel(v_AdjNew);
for i = 1:numberOfEdges
    if v_AdjNew(i) == 0
        v_AdjNew(i) = Inf;
    end
end

numOfTotalPoints = numPoints*numLevels;

for i = 1:numOfTotalPoints
    if v_ClusterLevel(i) == numLevels
        v_AdjNew(:, i) = Inf;
    end
end


end