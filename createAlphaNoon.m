% createAlphaNoon
% creates Alpha_noon for GTSP solver
% INPUTS
% v_Adj = matrix of all points with the edges and their costs
% numPoints = number of initial points
% OUTPUTS
% alpha = the penalty in noon_bean solver

function [alpha] = createAlphaNoon(v_Adj, numPoints)

[sand1, sand2] = find(v_Adj(1, :), 1);
newSand2 = sand2;
array1 = [sand1];
array2 = [newSand2];
for i = 1:numPoints-2
    oldSand2 = newSand2;
    [~, sand2] = find(v_Adj(newSand2, newSand2:end), 1);
    newSand2 = sand2+oldSand2-1;
    array1(end+1) = oldSand2;
    array2(end+1) = newSand2;
end
array1(end+1) = newSand2;
array2(end+1) = 1;

cost = 0;
numEdges = numel(array1);
for i = 1:numEdges
    cost = cost + v_Adj(array1(i), array2(i));
end

alpha = cost;

end