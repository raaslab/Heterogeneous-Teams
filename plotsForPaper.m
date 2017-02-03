% plotsForPaper
% this creates all plots needed for one run. You need to load a .mat first
% contained within ./answers/

% original graph with no edges
figure(1);
scatter(x1, y1, 'filled', 'd')
title({'Initial Graph Without Edge Costs', 'Edges are Euclidean Distances Between Points'})
xlabel('x Position')
ylabel('y Position')
axis([0 100 0 100])

% UAV tour
figure(2);
plot(G3, 'XData', x4, 'YData', y4, 'EdgeLabel', G3.Edges.Weight)        % creates the final UAV tour
title('Final UAV tour')
xlabel('x Position')
ylabel('y Position')
axis([0 100 0 100])

% UGV tour
figure(3);
plot(G4, 'XData', x5, 'YData', y5)
title('Final UGV tour')
xlabel('x Position')
ylabel('y Position')
axis([0 100 0 100])

% UAV cluster tour ordered
graphingClusterOrdered(x3, y3, numPointsInit, numBatteryLevels, S2, T2, v_Cluster, finalTour)
title('Final Cluster Plot of UAV Ordered with respect to next cluster')
xlabel('No Meaning')
ylabel('No Meaning')

% UAV cluster tour not ordered
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2, 'yes', nodeArray);        % graphing the cluster format of the solution
title('Final Cluster Plot of UAV not in Order')
xlabel('No Meaning')
ylabel('No Meaning')

