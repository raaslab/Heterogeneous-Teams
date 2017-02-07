% createEdgesGTSP
% creates edges from S to T with weights, within gtspSolver.m
% INPUTS
% G = a graph
% S = starting node for an edge in order in order matching with T
% T = ending node for an edge in order matching with S
% v_Adj = the adjacency matrix that gives costs

% OUTPUTS
% G = a graph with the edges implemented and weights

function [G] = createEdgesGTSP(G, S, T, v_Adj)


SNew = arrayfun(@(x) num2str(x), S, 'UniformOutput', false);
TNew = arrayfun(@(x) num2str(x), T, 'UniformOutput', false);
numOfEdges = numel(S);
for i = 1:numOfEdges
    G = addedge(G, SNew(i), TNew(i), v_Adj(S(i), T(i)));


end
