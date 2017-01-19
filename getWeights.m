% getWeights

% INPUTS

% OUTPUTS

function [weights] = getWeights(G, edgeMatrix, tour)

[row, col] = find(edgeMatrix);
numEdges = numel(row);
weights = [row, col];
weightMatrix = [];
for i = 1:numEdges
    weightMatrix(end+1) = [tour(row(i), col(i))];
end


end