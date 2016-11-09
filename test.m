% test
% testing of program
% for my own work
numPoints = 9;
[G, x, y] = graphMaking(numPoints);
[G] = createEdges(G, numPoints);

% x
% y
% G
% G.Edges
% figure(1)
% plot(G)
figure(2)
plot(G, 'XData', x, 'YData', y)


