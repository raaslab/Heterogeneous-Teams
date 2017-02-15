% plotsForPaperGeneral
% this creates all plots needed for one run. You need to load a .mat first
% contained within ./answers/

% original graph with no edges
figure(1);
scatter(x1, y1, 'filled', 'd')
title({'Initial Graph Without Edge Costs', 'Edges are Euclidean Distances Between Points'}, 'FontSize', 14)
xlabel('x Position', 'FontSize', 14)
ylabel('y Position', 'FontSize', 14)
axis([0 100 0 100])
box on;
grid on;
axis equal;

% UAV tour
figure(2);
h2 = plot(G3, 'XData', x4, 'YData', y4, 'LineWidth', 2, 'MarkerSize', 2)        % creates the final UAV tour
title('Final UAV tour', 'FontSize', 14)
xlabel('x Position', 'FontSize', 14)
ylabel('y Position', 'FontSize', 14)
axis([0 100 0 100])
box on;
grid on;
axis equal;
numEdges = numel(G4.Edges);
% for i = 0:numEdges-1
%     highlight(h2, [G4.Edges.EndNodes(i*2+1), G4.Edges.EndNodes(i*2+2)], 'NodeColor', 'r', 'Marker', 's', 'MarkerSize', 3)
% end
% s = [7, 4];     % testcase.mat
% t = [5, 1];     % testcase.mat
s = [2, 7];     % testcase2.mat
t = [5, 6];     % testcase2.mat
highlight(h2, s, t, 'EdgeColor', 'r');

% UGV tour
% hold on;
figure(3);
h3 = plot(x5, y5, '-.rs', 'LineWidth', 1, 'MarkerSize', 2, 'MarkerEdgeColor', 'r')
title('Final UGV tour', 'FontSize', 14)
xlabel('x Position', 'FontSize', 14)
ylabel('y Position', 'FontSize', 14)
axis([0 100 0 100])
box on;
grid on;
axis equal;

% UAV cluster tour ordered
graphingClusterOrdered(x3, y3, numPointsInit, numBatteryLevels, S2, T2, v_Cluster, finalTour)
title('Final Cluster Plot of UAV Ordered with respect to next cluster', 'FontSize', 14)
axis off;

% UAV cluster tour not ordered
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2, 'yes', nodeArray);        % graphing the cluster format of the solution
title('Final Cluster Plot of UAV not in Order', 'FontSize', 14)
axis off;

