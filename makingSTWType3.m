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
    for j = 1:totalPoints
        rechargeTime = rRate*(v_ClusterLevels(j)-v_ClusterLevels(i));
        UAVTravelTime = distances(v_Cluster(i), v_Cluster(j));
       
        cost = UAVTravelTime + rechargeTime + timeTO + timeL;
        
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
