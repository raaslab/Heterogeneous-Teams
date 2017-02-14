% sandBox
% used to test random functions
% this is not the actual code
% DON'T ADD CLEAR OR CLC OR CLOSE, this way you can use existing data

timeTO = 1;
timeL = 2;
rechargeRate = 3;
makingSTWv_AdjGeneral(area, x1, y1, numPointsInit, numBatteryLevels, v_Cluster, timeTO, timeL, rechargeRate)


% makingSTWv_Adj(area, x1, y1, numPointsInit, numBatteryLevels, v_Adj, v_Cluster)
% graphingClusterOrdered(x1, y1, numPointsInit, numBatteryLevels, S2, T2, v_Cluster, v_Adj, finalTour)
% [ans1, ans2, ans3] = createUGVTour(x3, y3, finalTour, numPointsInit, numBatteryLevels);
% numOfBaseStation = numel(clusterTour);
% numOfFinalTour = numel(finalTour);
% locationOfBase = find(finalTour == numOfBaseStation);
% if(numOfFinalTour == locationOfBase)
%     if(mod(finalTour(1), numLevels) ~= 1)
%         finalTour = fliplr(finalTour);
%     end
% else
%     if(mod(finalTour(locationOfBase + 1, numLevels) ~=1))
%         finalTour = fliplr(finalTour);
%     end
% end
% if(numOfFinalTour == locationOfBase)
%     ;
% else
%     finalTourBaseEnd = circshift(finalTour, numOfFinalTour-locationOfBase);
% end
% [edgeArray, S2, T2] = createEdgeArray(finalMatrix, numPointsInit, numBatteryLevels);
% gtspSolver(v_Cluster, v_Adj, numPointsInit, xOut, yOut)
% [sizeOfv_Adj, ~] = size(v_Adj);
% [sand1, sand2] = find(v_Adj(1, :), 1);
% newSand2 = sand2;
% array1 = [sand1];
% array2 = [newSand2];
% for i = 1:numPointsInit-2
%     oldSand2 = newSand2;
%     [~, sand2] = find(v_Adj(newSand2, newSand2:end), 1);
%     newSand2 = sand2+oldSand2-1;
%     array1(end+1) = oldSand2;
%     array2(end+1) = newSand2;
% end
% array1(end+1) = newSand2;
% array2(end+1) = 1;
% 
% cost = 0;
% numEdges = numel(array1);
% for i = 1:numEdges
%     cost = cost + v_Adj(array1(i), array2(i));
% end
% [x5, y5, nodeArrayUGV] = createUGVTour(x3, y3, S2, T2, numPointsInit, numBatteryLevels);
% G4 = digraph;
% [G4, x5, y5] = graphMakingWPoints(x5, y5, G4, nodeArrayUGV);
% [S3, T3] = makingUGVst(nodeArrayUGV);
% [G4] = createEdges(G4, S3, T3);
% figure(6);
% plot(G4, 'XData', x5, 'YData', y5)
% graphingCluster(x1, y1, numPointsInit, numBatteryLevels, S3, T3, 'yes', nodeArray);        % graphing the cluster format of the solution
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