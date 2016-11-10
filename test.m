% test
% testing of program
% for my own work

% variables
numPoints = 3;
numBatteryLevels = 2;

% code
[G, x, y] = graphMaking(numPoints);
[G] = createEdges(G, numPoints);
tableMaking(x, y, numBatteryLevels);



% outputs
% x
% y
% G
% G.Edges
% figure(1)
% plot(G)
figure(2)
plot(G, 'XData', x, 'YData', y)



