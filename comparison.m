
load rando1.mat;
method = 0;
numUGVs = 2;
sitesPerUGV = numPointsInit/numUGVs;
counter = 1;
maxDistance = sqrt((area(1)-area(2))^2+(area(3)-area(4))^2)
for i = 1:numUGVs
    for j = 1:sitesPerUGV
        UGVsitesX(i,j) = GLNSx(counter);
        UGVsitesY(i,j) = GLNSy(counter);
        counter = counter + 1;
    end
end
UGVLocation = [];
UGVLocation(:,end+1) = UGVsitesX(:, round(sitesPerUGV/2));
UGVLocation(:,end+1) = UGVsitesY(:, round(sitesPerUGV/2));
compCluster = 1:sitesPerUGV;
solutions = nan(numUGVs, sitesPerUGV);
totCosts = [];
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
    while Out_sol(1) ~= round(sitesPerUGV/2)
        Out_sol = circshift(Out_sol,1);
        tempX = circshift(tempX,1);
        tempY = circshift(tempY,1);
    end
    totDist = 0;
    stops = 1;
    extraDist = 0;
    removalDist = [0];
    for i = 1:sitesPerUGV-1
        points = [tempX(i), tempY(i); tempX(i+1), tempY(i+1)];
        dist = pdist(points,'euclidean');
        totDist = totDist + dist;
        if totDist > maxDistance*stops
            removalDist(end+1) = dist;
            stops = stops + 1;
            points = [tempX(i), tempY(i); tempX(1), tempY(1)];
            tempExtraDist = pdist(points, 'euclidean');
            extraDist = extraDist + tempExtraDist;
            points = [tempX(1), tempY(1); tempX(i+1), tempY(i+1)];
            tempExtraDist = pdist(points, 'euclidean');
            extraDist = extraDist + tempExtraDist;
            i = i+1;
        end
    end
    points = [tempX(end), tempY(end); tempX(1), tempY(1)];
    lastLeg = pdist(points, 'euclidean');
    totCosts(end+1) = totDist - sum(removalDist) + extraDist + stops*(timeL+timeTO) + lastLeg;
    solutions(k,:) = Out_sol;
end
UGVlegs = 0;
for i = 1:numUGVs-1
    points = [UGVLocation(i,1), UGVLocation(i,2); UGVLocation(i+1,1), UGVLocation(i+1,2)];
    UGVlegs = UGVlegs + pdist(points, 'euclidean');
end
totCost = sum(totCosts) + UGVlegs;
% gtspSolver(compCluster, v_Adj, sitesPerUGV,

% rangemaxDistance/numUGVs;
% [finalMatrix, G_init, weights, finalTour, atspAdjMatrix, v_AdjChecker] = gtspSolver(v_Cluster, v_Adj, numPointsInit, numBatteryLevels, xOut, yOut, method);


finalMatrix;

