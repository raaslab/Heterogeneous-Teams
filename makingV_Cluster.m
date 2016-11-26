% makingV_Cluster
% INPUTS
% numOfPoints = how many clusters you want
% numLevels = how many duplicated points for the cluster
% OUTPUTS
% V_Cluster = input for GTSP solver

function [V_Cluster] = makingV_Cluster(numOfPoints, numLevels)


count = 1;
for i = 1:numOfPoints
    for j = 1:numLevels
        V_Cluster(count, :) = i;
        count = count+1;
    end
end

end