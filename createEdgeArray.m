% createEdgeArray
% INPUTS
% x_reshape = comes from GTSP solver
% OUTPUTS
% edgeArray = array of edges that need to be created

function [edgeArray, i, j] = createEdgeArray(x_reshape)

[i, j] = find(x_reshape);
edgeArray = [i,j];


end