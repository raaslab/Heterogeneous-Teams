% makingSTWType2
% makes charge edges which are edges that contain UGV carrying UAV to allow
% for charging on the move
% INPUTS

% OUTPUTS


function [type2] = makingSTWType2(numPoints, numLevels, v_Adj, v_Cluster, timeTO, timeL, distances, v_ClusterLevels, rRate)

v_Cluster = cell2mat(v_Cluster);
type2 = v_Adj;
numOfEdges = numel(type2);
totalPoints = numPoints * numLevels;

for i = 1:totalPoints
    for j = 1:totalPoints
        if v_ClusterLevels(j) >= v_ClusterLevels(i)
            rechargeTime = rRate*(v_ClusterLevels(j)-v_ClusterLevels(i));
            UGVTravelTime = distances(v_Cluster(i), v_Cluster(j));
            comparedTimes = [rechargeTime, UGVTravelTime];
            finalComparedTimes = max(comparedTimes);
            if finalComparedTimes ~= 0
                cost = finalComparedTimes + timeTO + timeL;
                type2(i, j) = cost;
            end
        end
    end
end

for i = 1:totalPoints
    for j = 1:totalPoints
        if v_Cluster(i) == v_Cluster(j)
           type2(i, j) = Inf; 
        end
    end
end


end
