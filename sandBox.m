% sandBox
% used to test random functions
% this is not the actual code
% DON'T ADD CLEAR OR CLC, this way you can use existing data

[x5, y5, nodeArrayUGV] = createUGVTour(x3, y3, S2, T2, numPointsInit, numBatteryLevels);
G4 = digraph;
[G4, x5, y5] = graphMakingWPoints(x5, y5, G4, nodeArrayUGV);
[S3, T3] = makingUGVst(nodeArrayUGV);
[G4] = createEdges(G4, S3, T3);
figure(6);
plot(G4, 'XData', x5, 'YData', y5)
graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S3, T3, 'yes', nodeArray);        % graphing the cluster format of the solution




% [xNew, yNew, UGVTour] = createUGVTour(x3, y3, S2, T2, numPointsInit, numBatteryLevels);
% xNew
% yNew
% index
% UGVTour
% [xNew, yNew, array] = createUAVTour(x3, y3, S2, T2)
% [vNewC, vNewA] = createBaseStation(v_Cluster, v_Adj);
% [x_reshapenew, G_finalnew, fvalnew, exitflagnew, outputnew] = call_gtsp_recursive_func(vNewC, vNewA);
% graphingCluster(x3d, y3d, z3d, numPointsInit, numBatteryLevels, S1, T1);
% pos = [0.75, 0, 0.5, (numBatteryLevels+1)];       % creates oval, but needs to be fixed
% rectangle('Position', pos, 'Curvature', [1 1])
% pos = [1.75, 0, 0.5, (numBatteryLevels+1)];
% rectangle('Position', pos, 'Curvature', [1 1])
% k = boundary(x', y');
% hold on;
% plot(x(k), y(k));