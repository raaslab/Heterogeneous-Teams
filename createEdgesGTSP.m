% createEdgesGTSP
% creates edges from S to T with weights, within gtspSolver.m
% INPUTS
% G = a graph
% S = starting node for an edge in order in order matching with T
% T = ending node for an edge in order matching with S
% weigths = the weight of each edge
% OUTPUTS
% G = a graph with the edges implemented and weights

function [G] = createEdgesGTSP(G, S, T, v_Adj, xOut, yOut)

% switch nargin
%     case 4
SNew = arrayfun(@(x) num2str(x), S, 'UniformOutput', false);
TNew = arrayfun(@(x) num2str(x), T, 'UniformOutput', false);
numOfEdges = numel(S);
for i = 1:numOfEdges
    G = addedge(G, SNew(i), TNew(i), v_Adj(S(i), T(i)));
end
%         G.Edges.Weights = weights;
%     case 3
%         SNew = arrayfun(@(x) num2str(x), S, 'UniformOutput', false);
%         TNew = arrayfun(@(x) num2str(x), T, 'UniformOutput', false);
%         numOfEdges = numel(S);
%         for i = 1:numOfEdges
%             G = addedge(G, SNew(i), TNew(i));
%         end
% end

end
