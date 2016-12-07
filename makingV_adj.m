% makingV_adj
% INPUTS
% x = all x corrdinates
% y = all y corrdinates
% s = starting node of an edge that corresponds with nodes in numerical
% order
% t = end of edge that corresponds with "s"
% weights = the weights that correspond with "(s, t) edge"
% OUTPUTS
% V_adj = input for GTSP solver
% points = matrix of points


function [V_adj, points] = makingV_adj(x, y, s, t, weights)

numOfNodes = numel(x);
points1 = [x', y'];
points2 = [s', t']
cost1 = [];
for i = 1:numOfNodes
    tempPoints(1, :) = points1(i, :);
   for j = 1:numOfNodes
       tempPoints(2, :) = points1(j, :);
       distanceXY = pdist(tempPoints, 'euclidean');
       cost1(i, j) = distanceXY;
   end
end

numOfEdges = numel(s);

for i = 1:numOfNodes
   for j = 1:numOfNodes
       for k = 1:numOfEdges
           if (i==s(k)) && (j==t(k))
               cost2(i, j) = cost1(i, j);
           end
       end
   end
end



points = points1;
V_adj = cost2;

end
