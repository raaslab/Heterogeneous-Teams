% makingV_adj
% INPUTS
% x = all x corrdinates
% y = all y corrdinates
% s = starting node of an edge that corresponds with nodes in numerical
% order
% t = end of edge that corresponds with "s"
% weights = the weights that correspond with "(s, t) edge"
% type = either symetric matrix ('bi-directional') or non-symetric matrix('directed')
% OUTPUTS
% V_adj = input for GTSP solver
% points = matrix of points


function [V_adj, points] = makingV_adj(x, y, s, t, weights, type)

numOfNodes = numel(x);
numOfEdges = numel(s);
points1 = [x', y'];
points2 = [s', t'];
cost1 = [];
cost2 = [];

% Creates a symetric matrix, which creates all edge costs as bi-directional
for i = 1:numOfNodes
    tempPoints(1, :) = points1(i, :);
    for j = 1:numOfNodes
        tempPoints(2, :) = points1(j, :);
        distanceXY = pdist(tempPoints, 'euclidean');
        cost1(i, j) = distanceXY;
    end
end


% Does non-symetric matrix, meaning it's a directional cost matrix output
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
if (strcmp(type, 'bi-directional'))
    V_adj = cost1;
elseif (strcmp(type, 'directed'))
    V_adj = cost2;
end


end
