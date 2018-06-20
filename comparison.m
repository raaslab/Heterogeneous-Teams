
load 0rando1.mat;
% G = graph(s,t,weights);
compG1 = G1;
[compLen, compLen1] = size(compG1.Edges);
tempWeights = zeros([compLen, compLen1]);
counter = 1;
budget = 150;
for i = 1:numPointsInit
    for j = i+1:numPointsInit
        points = [x1(i), y1(i); x1(j), y1(j)];
        tempWeights(counter) = pdist(points, 'euclidean');
        counter = counter+1;
    end
end
compG1.Edges.Weight = tempWeights;
[minTree, pred] = minspantree(compG1);
p = plot(compG1, 'XData', x1, 'YData', y1, 'EdgeColor','none');
highlight(p,minTree);
plot(minTree, 'XData', x1, 'YData', y1);
centers = [x1',y1'];
radii = ones([numPointsInit, 1])*(budget/2);
% viscircles(centers, radii)
tempSolution = pdist2(centers, centers);
tempCircleHits = [];
for i = 1:numPointsInit
    rowAdd = find(tempSolution(i,:) < (budget/2));
    while length(rowAdd) ~= numPointsInit
        rowAdd = [rowAdd, NaN];
    end
    tempCircleHits = [tempCircleHits; rowAdd];
end

circleKeep = [];
sitesCircleKeep = [];
while(min(min(isnan(tempCircleHits)))~=1)
    lengthsOfTempCircleHits = sum(~isnan(tempCircleHits),2);
    maxOfTempCircleHits = max(lengthsOfTempCircleHits);
    locationOfMax = find(lengthsOfTempCircleHits==maxOfTempCircleHits);
    circleKeep(end+1) = locationOfMax(1); %#ok<*SAGROW>
    tempCircleKeep = tempCircleHits(locationOfMax(1), :);
    sitesCircleKeep(end+1, :) = tempCircleKeep;
    hitSites = tempCircleKeep(~isnan(tempCircleKeep));
    for i = 1:length(hitSites)
        tempCircleHits(tempCircleHits == hitSites(i)) = NaN;
    end
end

sitesCircleKeep = [sitesCircleKeep, circleKeep'];
tempSitesCircleKeep = [];
for i = 1:length(circleKeep)
    testing = unique(sitesCircleKeep(i, :),'stable');
    while length(testing)<numPointsInit+1
        testing = [testing, NaN];
    end
    
    tempSitesCircleKeep(end+1, :) = testing;
    
end
sitesCircleKeep = tempSitesCircleKeep;

keptCenters = zeros([length(circleKeep), 2]);
for i = 1:length(circleKeep)
    keptCenters(i,1) = x1(circleKeep(i));
    keptCenters(i,2) = y1(circleKeep(i));
end
figure()
plot(minTree, 'XData', x1, 'YData', y1);
radii = ones([length(keptCenters), 1]) * (budget/2);
viscircles(keptCenters, radii)

totalUGVCostPath = 0;
DFS = dfsearch(minTree,1);
tempCircleKeep = nan([length(circleKeep),1]);
for i = 1:length(circleKeep)
        tempCircleKeep(i) = find(DFS==circleKeep(i));
end
for i = 1:length(circleKeep)
    tempTempCircleKeep(tempCircleKeep(i)) = circleKeep(i);
end
UGVcircleKeep = tempTempCircleKeep;
UGVcircleKeep(UGVcircleKeep==0) = [];

for i = 1:length(UGVcircleKeep)-1 % TODO: make this a depth first search instead of in order of circleKeep
    [tempPath, tempCostUGVPath] = shortestpath(minTree, UGVcircleKeep(i), UGVcircleKeep(i+1));
    totalUGVCostPath = totalUGVCostPath + tempCostUGVPath;
end

numUGVs = length(circleKeep);
% sitesPerUGV = numPointsInit/numUGVs;
% maxDistance = sqrt((area(1)-area(2))^2+(area(3)-area(4))^2);
UGVsitesX = [];
UGVsitesY = [];
for i = 1:numUGVs
    for j = 1:numPointsInit+1
        if isnan(sitesCircleKeep(i,j))
            UGVsitesX(i,j) = NaN;
            UGVsitesY(i,j) = NaN;
        else
            UGVsitesX(i,j) = x1(sitesCircleKeep(i,j));
            UGVsitesY(i,j) = y1(sitesCircleKeep(i,j));
        end
    end
end
UGVLocation = keptCenters;
% UGVsitesX = [UGVsitesX, UGVLocation(:,1)];
% UGVsitesY = [UGVsitesY, UGVLocation(:,2)];

compCluster = 1:numPointsInit;
solutions = nan(numUGVs, numPointsInit);
totCosts = [];
for k = 1: numUGVs
    concordeG = graph([], []);
    tempX = UGVsitesX(k,:);
    tempY = UGVsitesY(k,:);
    tempOutSites = sitesCircleKeep(k,:);
    tempX(isnan(tempX)) = []; % removing NaN
    tempY(isnan(tempY)) = [];
    tempOutSites(isnan(tempOutSites)) = [];
    for i = 1:length(tempX)
        for j = i+1:length(tempX)
            points = [tempX(i), tempY(i); tempX(j), tempY(j)];
            tempWeight = pdist(points,'euclidean');
            concordeG = addedge(concordeG, i, j, tempWeight);
            
        end
    end
    
    if length(tempX)<3
        Out_sol = sitesCircleKeep(k,:);
        Out_sol(isnan(Out_sol)) = [];
        if length(tempX) == 2
            point = [x1(Out_sol(1)), y1(Out_sol(1)); x1(Out_sol(2)), y1(Out_sol(2))];
            totDist = pdist(point, 'euclidean');
        else % only one site
            totDist = 0;
        end
        while Out_sol(1) ~= circleKeep(k)
            Out_sol = circshift(Out_sol,1);
        end
        totCosts(end+1) = 2*totDist + timeL + timeTO;
        for i = length(tempX):numPointsInit-1
            Out_sol = [Out_sol, NaN];
        end
        solutions(k,:) = Out_sol;
        
    else
        [Out_sol, ~] = TSP_tour_Dat(concordeG,'/home/klyu/software/concorde/concorde/TSP/concorde');
        outSites = nan([length(Out_sol), 1]);
        for i = 1:length(Out_sol)
            outSites(i) = tempOutSites(Out_sol(i));
        end
        while outSites(1) ~= circleKeep(k)
            Out_sol = circshift(Out_sol,1);
            outSites = circshift(outSites,1);
        end
        totDist = 0;
        stops = 1;
        extraDist = 0;
        removalDist = [0];
        tempXNew = tempX;
        tempYNew = tempY;
        for i = 1:length(Out_sol)
            tempX(i) = tempXNew(Out_sol(i));
            tempY(i) = tempYNew(Out_sol(i));
        end
        
        for i = 1:length(Out_sol)-1
            points = [tempX(i), tempY(i); tempX(i+1), tempY(i+1)];
            dist = pdist(points,'euclidean');
            totDist = totDist + dist;
            if totDist > budget*stops
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
%         for i = length(tempX):numPointsInit-1
%             Out_sol = [Out_sol; NaN];
%         end
        correctedOut_sol = nan([length(Out_sol),1]);
        for i = 1:length(Out_sol)
            correctedOut_sol(i) = sitesCircleKeep(k,Out_sol(i));
        end
        for i = length(tempX):numPointsInit-1
            correctedOut_sol = [correctedOut_sol; NaN];
        end
        
        solutions(k,:) = correctedOut_sol;
    end
end
% UGVlegs = 0;
% for i = 1:numUGVs-1
%     points = [UGVLocation(i,1), UGVLocation(i,2); UGVLocation(i+1,1), UGVLocation(i+1,2)];
%     UGVlegs = UGVlegs + pdist(points, 'euclidean');
% end
totCost = sum(totCosts) + totalUGVCostPath;

% totCostMine = 0;
% for i = 1:numPointsInit-1
%     points = [GLNSx(i), GLNSy(i); GLNSx(i+1), GLNSy(i+1)];
%     totCostMine = totCostMine + pdist(points, 'euclidean');
% end
% gtspSolver(compCluster, v_Adj, sitesPerUGV,

% rangemaxDistance/numUGVs;
% [finalMatrix, G_init, weights, finalTour, atspAdjMatrix, v_AdjChecker] = gtspSolver(v_Cluster, v_Adj, numPointsInit, numBatteryLevels, xOut, yOut, method);


finalMatrix;

