% plotsForPaper
% this creates all plots needed for one run. You need to load a .mat first
% contained within ./answers/

% original graph with no edges
figure();
scatter(x1, y1, 'filled', 'd')
title({'Initial Graph Without Edge Costs', 'Edges are Euclidean Distances Between Points'})
xlabel('x Position')
ylabel('y Position')
axis([0 100 0 100])

% UAV tour
figure();
plot(G3, 'XData', x4, 'YData', y4, 'EdgeLabel', G3.Edges.Weight)        % creates the final UAV tour
title('Final UAV tour')
xlabel('x Position')
ylabel('y Position')
axis([0 100 0 100])

% UGV tour
figure();
plot(G4, 'XData', x5, 'YData', y5)
title('Final UGV tour')
xlabel('x Position')
ylabel('y Position')
axis([0 100 0 100])

% UAV cluster tour
%-------------------------------------------------------------------------%
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2, 'yes', nodeArray);        % graphing the cluster format of the solution
% graphClusterOrdered()
%-------------------------------------------------------------------------%

