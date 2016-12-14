% createEdges
% creates edges from S to T
% INPUTS
% G = a graph
% S = starting node for an edge in order in order matching with T
% T = ending node for an edge in order matching with S
% weigths = the weight of each edge
% OUTPUTS
% G = a graph with the edges implemented and weights

function [G] = createEdges(G, S, T, weights)

switch nargin
    case 4
        numOfEdges = numel(S);
        for i = 1:numOfEdges
            G = addedge(G, S(i), T(i));
        end
        G.Edges.Weights = weights;
    case 3
        numOfEdges = numel(S);
        for i = 1:numOfEdges
            G = addedge(G, S(i), T(i));
        end
end

end
