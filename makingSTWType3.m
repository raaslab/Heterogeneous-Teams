% makingSTWType3
% makes the edges that have UAV plus the charging of a UAV at a vertex on a
%  staionary UGV at the time
% INPUTS

% OUTPUTS


function [v_AdjNew] = makingSTWType3(numPoints, numLevels, v_Adj, v_Cluster, timeTO, timeL, distances, v_ClusterLevels, rRate)

v_Cluster = cell2mat(v_Cluster);
v_AdjNew = v_Adj;
totalPoints = numPoints * numLevels;

for i = 1:totalPoints
    for j = 1:numPoints
        if v_Cluster(i) ~= j
            pointA = i;
            pointB = find(v_Cluster == j);
            correctPointB = flipud(pointB);
            originalEdge = find(v_AdjNew(pointA, pointB(1):pointB(end)) ~= Inf);
            lowestLevel = v_ClusterLevels(pointB(originalEdge));
            if lowestLevel == numLevels
                for k = 1:numLevels
                    rechargeTime = rRate*(k-lowestLevel);
                    UAVTravelTime = distances(v_Cluster(i), j);
                    cost = UAVTravelTime + rechargeTime + timeTO + timeL;
                    v_AdjNew(i, correctPointB(k)) = cost;
                end
            else
                for k = lowestLevel+1:numLevels
                    rechargeTime = rRate*(k-lowestLevel);
                    UAVTravelTime = distances(v_Cluster(i), j);
                    cost = UAVTravelTime + rechargeTime + timeTO + timeL;
                    v_AdjNew(i, correctPointB(k)) = cost;
                end
            end
        end
    end
end

for i = 1:totalPoints
    for j = 1:totalPoints
        if v_Cluster(i) == v_Cluster(j)
            v_AdjNew(i, j) = Inf;
        end
    end
end

end
