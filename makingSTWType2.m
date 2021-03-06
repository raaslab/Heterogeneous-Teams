% makingSTWType2
% makes charge edges which are edges that contain UGV carrying UAV to allow
% for charging on the move
% INPUTS
% UGVratio = the ratio of UGVTimeToTravel/UAVTimeToTravel (has to be greater than or equal to 1)
% OUTPUTS


function [v_AdjNew] = makingSTWType2(numPoints, numLevels, v_Adj, v_Cluster, timeTO, timeL, distances, v_ClusterLevels, rRate, UGVratio)

v_Cluster = cell2mat(v_Cluster);
totalPoints = numPoints * numLevels;
v_AdjNew(1:totalPoints, 1:totalPoints) = Inf;

for i = 1:totalPoints
    for j = 1:totalPoints
        if v_ClusterLevels(j) >= v_ClusterLevels(i)
            rechargeTime = rRate*(v_ClusterLevels(j)-v_ClusterLevels(i));
            UGVTravelTime = distances(v_Cluster(i), v_Cluster(j));
            UGVTravelTime = UGVratio * UGVTravelTime;
            comparedTimes = [rechargeTime, UGVTravelTime];
            finalComparedTimes = max(comparedTimes);
            if finalComparedTimes ~= 0
                cost = finalComparedTimes + timeTO + timeL;
                v_AdjNew(i, j) = cost;
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
