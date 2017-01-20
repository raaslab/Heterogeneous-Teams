% getWeights

% INPUTS

% OUTPUTS

function [G_finish, cost] = getWeights(G, edgeMatrix, tour)

sizeOfTour = numel(tour);
% weights = [row, col];
% weightMatrix = [];
G_newNode = G;
newNode = sizeOfTour;
newNode = num2str(newNode);
G_newNode = addnode(G_newNode, newNode);
row = [];
col = [];

% adding baseStation to X
s = [];
t = [];
w = [];
for i = 1:sizeOfTour
    s(end+1) = sizeOfTour;
    t(end+1) = i;
    w(end+1) = 0;
end

G_newEdges = addedge(G_newNode, s, t, w);

% adding X to baseStation
s = [];
t = [];
w = [];
for i = 1:sizeOfTour-1
    s(end+1) = i;
    t(end+1) = sizeOfTour;
    w(end+1) = 0;
end
G_newEdges = addedge(G_newEdges, s, t, w);

for i = 1:sizeOfTour-1
    row(end+1) = tour(i);
    col(end+1) = tour(i+1);
end

row(end+1) = tour(end);
col(end+1) = tour(1);

row = arrayfun(@(x) num2str(x), row, 'UniformOutput', false);
col = arrayfun(@(x) num2str(x), col, 'UniformOutput', false);

G_finish = G_newEdges;
indexOut = findedge(G_finish, row, col);

sizeOfIndex = numel(indexOut);
cost = [];
weights = G_finish.Edges.Weight;
for i = 1:sizeOfIndex
    if indexOut(i) ~=0
        cost(end+1) = weights(indexOut(i));
    else
        cost(end+1) = 0;
    end
end


end