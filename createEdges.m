% createEdges
% INPUTS
% G = a graph
% arrayOfEdges = the array of connected edges
% OUTPUTS
% G = a graph with the edges implemented and weights

function [G] = createEdges(G, edgeArray, S, T, weights)


numOfEdges = numel(S)
for i = 1:numOfEdges
    G = addedge(G, S(i), T(i))
end
G.Edges.Weights = weights;


end
