% makingV_adj
% INPUTS
% x = all x corrdinates
% y = all y corrdinates
% OUTPUTS
% V_adj = input for GTSP solver
% points = matrix of points


function [V_adj, points] = makingV_adj(x, y)

numOfNodes = numel(x);
points = [x', y'];
cost = [];
for i = 1:numOfNodes
    tempPoints(1, :) = points(i, :);
   for j = 1:numOfNodes
       tempPoints(2, :) = points(j, :);
       distanceXY = pdist(tempPoints, 'euclidean');
       cost(i, j) = distanceXY;
   end
end
V_adj = cost;

end
