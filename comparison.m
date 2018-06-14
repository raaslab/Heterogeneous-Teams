
load rando1.mat;
method = 0;
numUGVs = 5;
sitesPerUGV = numPointsInit/numUGVs;
counter = 1;
for i = 1:numUGVs
    for j = 1:sitesPerUGV
        UGVsitesX(i,j) = GLNSx(counter);
        UGVsitesY(i,j) = GLNSy(counter);
        counter = counter + 1;
    end
end
UGVLocation = [];
UGVLocation(:,end+1) = UGVsitesX(:, sitesPerUGV/2);
UGVLocation(:,end+1) = UGVsitesY(:, sitesPerUGV/2);
compCluster = 1:sitesPerUGV;
solutions = nan(numUGVs, sitesPerUGV);
for k = 1: numUGVs
    compG1 = graph([], []);
    tempX = UGVsitesX(k,:);
    tempY = UGVsitesY(k,:);
    for i = 1:sitesPerUGV
        for j = i+1:sitesPerUGV
            points = [tempX(i), tempY(i); tempX(j), tempY(j)];
            compG1 = addedge(compG1, i, j, pdist(points,'euclidean'));
        end
    end
    [Out_sol, ~] = TSP_tour_Dat(compG1,'/home/klyu/software/concorde/concorde/TSP/concorde');
    solutions(k,:) = Out_sol;
end
% gtspSolver(compCluster, v_Adj, sitesPerUGV,

% rangemaxDistance/numUGVs;
% [finalMatrix, G_init, weights, finalTour, atspAdjMatrix, v_AdjChecker] = gtspSolver(v_Cluster, v_Adj, numPointsInit, numBatteryLevels, xOut, yOut, method);


finalMatrix;

