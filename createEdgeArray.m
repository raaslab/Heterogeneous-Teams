% createEdgeArray
% creates an array of wanted edges
% INPUTS
% x_reshape = comes from GTSP solver
% OUTPUTS
% edgeArray = array of edges that need to be created

function [edgeArray, i, j] = createEdgeArray(x_reshape, numPoints, numLevels)

totalPoints = numPoints*numLevels;
correctEdges = x_reshape(:, 1:totalPoints);
[i, j] = find(correctEdges);
edgeArray = [i,j];


end