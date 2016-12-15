% testRandom
% used to test random functions
% DON'T ADD CLEAR OR CLC, this way you can use existing data

[G, x, y] = graphingGTSP(x3d, y3d, z3d, 3, 5);
[G] = createEdges(G, S1, T1)
figure(7)
plot(G, 'XData', x, 'YData', y, 'LineStyle', '-.');


% pos = [0.75, 0, 0.5, (numBatteryLevels+1)];       % Creates oval, but needs to be fixed
% rectangle('Position', pos, 'Curvature', [1 1])
% pos = [1.75, 0, 0.5, (numBatteryLevels+1)];
% rectangle('Position', pos, 'Curvature', [1 1])
% 
% k = boundary(x', y');
% hold on;
% plot(x(k), y(k));