% createEdgeArray
% creates an array of wanted edges
% INPUTS
% x_reshape = comes from GTSP solver
% numPoints = number of nodes in a graph
% numLevels = number of battery levels in a graph
% OUTPUTS
% edgeArray = array of edges that need to be created

function [edgeArray, i, j] = createEdgeArray(x_reshape, numPoints, numLevels)

totalPoints = (numPoints*numLevels)+1;
correctEdges = x_reshape(:, 1:totalPoints);
[i, j] = find(correctEdges);
edgeArray = [i,j];


end