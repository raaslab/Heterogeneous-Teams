function graphMaking(numPoints)

x = [];
y = [];
G = graph;
for i = 1:numPoints
    [x(end+1), y(end+1)] = randomPoints(1,1,1);
end

% x
% y
G = addnode(G,numPoints);
G
G.Nodes
G.Edges
plot(G, 'XData', x, 'YData', y)

end