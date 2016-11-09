% test
% testing of program
% for my own work
numPoints = 5;
[G, x, y] = graphMaking(numPoints);
for i = 1:numPoints
    for j = i:numPoints
        if i ~= j
            s = [i];
            t = [j];
            G = addedge(G, s, t);
        end
    end
end

% x
% y
% G
% G.Edges
% figure(1)
% plot(G)
figure(2)
plot(G, 'XData', x, 'YData', y)


