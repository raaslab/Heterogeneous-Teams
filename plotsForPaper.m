% plotsForPaper
% this creates all plots needed for one run. You need to load a .mat first
% contained within ./answers/

%%% original graph with no edges
% figure(1);
% scatter(x1, y1, 'filled', 'd')
% title({'Initial Graph Without Edge Costs', 'Edges are Euclidean Distances Between Points'}, 'FontSize', 14)
% xlabel('x Position', 'FontSize', 14)
% ylabel('y Position', 'FontSize', 14)
% axis([0 100 0 100])
% box on;
% grid on;
% axis equal;

%%% UAV tour
figure(2);
h2 = plot(G3, 'XData', x4, 'YData', y4, 'LineWidth', 2, 'MarkerSize', 2)        % creates the final UAV tour
title('Final UAV tour', 'FontSize', 14)
xlabel('x Position', 'FontSize', 14)
ylabel('y Position', 'FontSize', 14)
axis([0 100 0 100])
box on;
grid on;
% axis equal;
% leave s, t, & nodeID empty to do no highlighting
% sUAV = [];
% tUAV = [];
% s = [];
% t = [];
% nodeID = [];
% highlight(h, nodeID)
% addedge(G3,sUAV,tUAV)
% highlight(h,sUAV,tUAV)
% highlight(h,s,t)
% hold on;

%%% UGV tour
figure(3);
% G4 = rmedge(G4,[12]);
h3 = plot(G4, 'XData', x5, 'YData', y5, 'LineWidth', 2, 'MarkerSize', 2, 'EdgeColor', 'r')
title('Final UGV tour', 'FontSize', 14)
xlabel('x Position', 'FontSize', 14)
ylabel('y Position', 'FontSize', 14)
axis([0 100 0 100])
box on;
grid on;
% axis equal;

%%% Creating UAV+UGV graph. This requires the combination of the UAV and
%%% UGV graph using hold on.
s21 = [8,10,13,1,19,5];
t21 = [14,13,18,19,5,20];
s31 = [7,9,10,12,1,2];
t31 = [8,10,11,1,2,3];
highlight(h2,s21,t21,'EdgeColor','g')
highlight(h3,s31,t31,'EdgeColor','g')
highlight(h2,s2,t2,'LineStyle','--')
highlight(h3,s3,t3,'LineStyle','--')
title('Final UAV & UGV Tour', 'FontSize',14)

%%% UAV cluster tour ordered
% graphingClusterOrdered(x3, y3, numPointsInit, numBatteryLevels, S2, T2, v_Cluster, finalTour)
% title('Final Cluster Plot of UAV Ordered with respect to next cluster', 'FontSize', 14)
% axis off;

%%% UAV cluster tour not ordered
% graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S2, T2, 'yes', nodeArray);        % graphing the cluster format of the solution
% title('Final Cluster Plot of UAV not in Order', 'FontSize', 14)
% axis off;

