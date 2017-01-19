% gtspReconvert
% converts concorde back to my gtsp to output from gtspSolver
% INPUTS
%
% OUTPUTS
%

function [matrix, finalTour] = concordeReconvert(G, tour)

tableOfPoints = G.Nodes;
cellOfPoints = table2array(tableOfPoints);
doubleOfPoints = arrayfun(@(x) str2double(x), cellOfPoints, 'UniformOutput', false);
matOfPoints = cell2mat(doubleOfPoints);
floorOfPoints = floor(matOfPoints);

numOfPoints = numel(floorOfPoints);
newTour = [];
for i = 1:numOfPoints
    newTour(end+1) = floorOfPoints(tour(i));
end

finalTour = union(newTour, [], 'stable');
numOfOnlyPoints = numel(finalTour);
matrix = zeros(10);
for i = 1:(numOfOnlyPoints-1)
    matrix(finalTour(i), finalTour(i+1)) = 1;
end

matrix(finalTour(numOfOnlyPoints), finalTour(1)) = 1;

end
