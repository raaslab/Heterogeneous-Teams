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
        %         SNew = arrayfun(@(x) num2str(x), S, 'UniformOutput', false);
        %         TNew = arrayfun(@(x) num2str(x), T, 'UniformOutput', false);
        SNew = S;
        TNew = T;
        numOfEdges = numel(S);
        for i = 1:numOfEdges
            G = addedge(G, SNew(i), TNew(i));
        end
        %         G.Edges.Weights = weights;
        indexOut = findedge(G, S, T);
        sizeOfIndex = numel(indexOut);
        cost = zeros(sizeOfIndex, 1);
        newWeights = cell2mat(weights);
        for i = 1:sizeOfIndex
            cost(indexOut(i)) = newWeights(i);
        end
        G.Edges.Weight = cost;
    case 3
        SNew = arrayfun(@(x) num2str(x), S, 'UniformOutput', false);
        TNew = arrayfun(@(x) num2str(x), T, 'UniformOutput', false);
        numOfEdges = numel(S);
        for i = 1:numOfEdges
            G = addedge(G, SNew(i), TNew(i));
        end
end

end
