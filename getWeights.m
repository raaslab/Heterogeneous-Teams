% getWeights
% gets the correct weights for the tour
% INPUTS
% G = graph that has correct weights
% edgeMatrix = matrix that shows which edges are being used
% tour = shows the final output tour
% OUTPUTS
% G_finish = final graph to plot if necessary
% cost = final weight matrix that will be used to show the costs of edges

function [G_finish, costArray] = getWeights(G, edgeMatrix, tour)

numOfNodes = numel(G.Nodes)+1;
G_newNode = G;
newNode = numOfNodes;
newNode = num2str(newNode);
G_newNode = addnode(G_newNode, newNode);
row = [];
col = [];
sizeOfTour = numel(tour);

% adding baseStation to other node
s = [];
t = [];
w = [];
for i = 1:numOfNodes
    s(end+1) = numOfNodes;
    t(end+1) = i;
    w(end+1) = 0;
end

G_newEdges = addedge(G_newNode, s, t, w);

% adding other node to baseStation
s = [];
t = [];
w = [];
for i = 1:numOfNodes-1
    s(end+1) = i;
    t(end+1) = numOfNodes;
    w(end+1) = 0;
end
G_newEdges = addedge(G_newEdges, s, t, w);

for i = 1:sizeOfTour-1
    row(end+1) = tour(i);
    col(end+1) = tour(i+1);
end

row = arrayfun(@(x) num2str(x), row, 'UniformOutput', false);
col = arrayfun(@(x) num2str(x), col, 'UniformOutput', false);

G_finish = G_newEdges;
weights = G_finish.Edges.Weight;

indexOut = findedge(G_finish, row, col);
sizeOfIndex = numel(indexOut);
cost = [];
for i = 1:sizeOfIndex
    if indexOut(i) ~=0
        cost(end+1) = weights(indexOut(i));
    else
        cost(end+1) = 0;
    end
end

% checks if the tour is backwards or not
if find(cost)
    costArray = [row', col', num2cell(cost')];
    
else
    indexOut = findedge(G_finish, col, row);
    cost = [];
    for i = 1:sizeOfIndex
        if indexOut(i) ~=0
            cost(end+1) = weights(indexOut(i));
        else
            cost(end+1) = 0;
        end
    end
    costArray = [col', row', num2cell(cost')];
    
end


end