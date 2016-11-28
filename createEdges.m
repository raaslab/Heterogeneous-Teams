% createEdges
% INPUTS
% G = a graph
% arrayOfEdges = the array of connected edges
% OUTPUTS
% G = a graph with the edges implemented

function [G] = createEdges(G, edgeArray, S, T)


sizeOfEdgeArray = numel(edgeArray)
for i = 1:sizeOfEdgeArray
    G = addedge(G, S, T)
end



end
