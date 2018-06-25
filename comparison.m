
load 9rando1.mat;
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

concorde_adjUGV = [];
for i = 1:length(UGVcircleKeep)
    for j = 1:length(UGVcircleKeep)
        points = [x1(UGVcircleKeep(i)), y1(UGVcircleKeep(i)); x1(UGVcircleKeep(j)), y1(UGVcircleKeep(j))];
        concorde_adjUGV(i,j) = pdist(points, 'euclidean');
    end
end
concordeUGVg = graph(concorde_adjUGV);
if length(UGVcircleKeep) > 2
    [Out_UGV, ~] = TSP_tour_Dat(concordeUGVg,'/home/klyu/software/concorde/concorde/TSP/concorde');
    trueUGVPath = nan([length(Out_UGV),1]);
    for i = 1:length(Out_UGV)
        trueUGVPath(i) = UGVcircleKeep(Out_UGV(i));
    end
    UGVPaths = []; % This is using TSP for the UGV path
    for i = 1:length(UGVcircleKeep)-1
        points = [x1(trueUGVPath(i)), y1(trueUGVPath(i)); x1(trueUGVPath(i+1)), y1(trueUGVPath(i+1))];
        tempCostUGVPath =  pdist(points, 'euclidean');
        totalUGVCostPath = totalUGVCostPath + tempCostUGVPath;
    end
else
    points = [x1(UGVcircleKeep(1)), y1(UGVcircleKeep(1)); x1(UGVcircleKeep(2)), y2(UGVcircleKeep(2))];
    totalUGVCostPath = pdist(points, 'euclidean');
end





% UGVPaths = []; % This is using Depth First Search method for finding the path of the UGV
% for i = 1:length(UGVcircleKeep)-1
%     [tempPath, tempCostUGVPath] = shortestpath(minTree, UGVcircleKeep(i), UGVcircleKeep(i+1));
%     for j = length(tempPath):numPointsInit-1
%         tempPath = [tempPath, NaN];
%     end
%     UGVPaths(end+1,:) = tempPath;
%     totalUGVCostPath = totalUGVCostPath + tempCostUGVPath;
% end

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
extraPoints = nan(numUGVs, numPointsInit);
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
        if length(tempX) == 2 % only two sites
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
        Out_extraPoints = [];
        i = 1;
        while i < length(Out_sol)
            %         for i = 1:length(Out_sol)-1
            points = [tempX(i), tempY(i); tempX(i+1), tempY(i+1)];
            dist = pdist(points,'euclidean');
            totDist = totDist + dist;
            if totDist > budget*stops
                removalDist(end+1) = dist;
                stops = stops + 1;
                Out_extraPoints(end+1) = Out_sol(i);
                points = [tempX(i), tempY(i); tempX(1), tempY(1)];
                tempExtraDist = pdist(points, 'euclidean');
                extraDist = extraDist + tempExtraDist;
                Out_extraPoints(end+1) = Out_sol(i+1);
                points = [tempX(1), tempY(1); tempX(i+1), tempY(i+1)];
                tempExtraDist = pdist(points, 'euclidean');
                extraDist = extraDist + tempExtraDist;
                i = i+1;
            end
            i = i+1;
            %         end
        end
        points = [tempX(end), tempY(end); tempX(1), tempY(1)];
        lastLeg = pdist(points, 'euclidean');
        totCosts(end+1) = totDist - sum(removalDist) + extraDist + stops*(timeL+timeTO) + lastLeg;
        correctedOut_sol = nan([length(Out_sol),1]);
        for i = 1:length(Out_sol)
            correctedOut_sol(i) = sitesCircleKeep(k,Out_sol(i));
        end
        correctedExtraPoints = nan([length(Out_sol),1]);
        for i = 1:length(Out_extraPoints)
            correctedExtraPoints(i) = sitesCircleKeep(k,Out_extraPoints(i));
        end
        
        for i = length(tempX):numPointsInit-1
            correctedOut_sol = [correctedOut_sol; NaN];
        end
        
        for i = length(tempX):numPointsInit-1
            correctedExtraPoints = [correctedExtraPoints; NaN];
        end
        
        solutions(k,:) = correctedOut_sol;
        extraPoints(k,:) = correctedExtraPoints;
        
    end
end

totCost = sum(totCosts) + totalUGVCostPath;
close all

% % Below is for plotting the outputs
% for i = 1:numUGVs
%     tempHighlight = solutions(i, :);
%     tempHighlight(isnan(tempHighlight)) = [];
%     for j = 1:length(tempHighlight)-1
%         if findedge(minTree,tempHighlight(j),tempHighlight(j+1)) == 0
%             points = [x1(tempHighlight(j)), y1(tempHighlight(j)); x1(tempHighlight(j+1)), y1(tempHighlight(j+1))];
%             minTree = addedge(minTree, tempHighlight(j), tempHighlight(j+1), pdist(points, 'euclidean'));
%         end
%     end
% end
%
% tempMinTree = minTree;
% for i = 1:numUGVs
%     figure(i)
%     H = plot(compG1, 'XData', x1, 'YData', y1, 'EdgeColor','w');
%     rectangle('Position',[keptCenters(i,1)-radii(i), keptCenters(i,2)-radii(i), radii(i)*2, radii(i)*2],'Curvature',1, 'EdgeColor','None', 'FaceColor',[0.8, 0.8, 0.8, 0.4])
%     highlight(H,circleKeep(i),'NodeColor','r')
%
%     tempHighlight = solutions(i, :);
%     tempHighlight(isnan(tempHighlight)) = [];
%     tempExtraPoints = extraPoints(i, :);
%     tempExtraPoints(isnan(tempExtraPoints)) = [];
%     j = 1;
%     graphExtraPoints = [];
%     counter = 1;
%     while j < length(tempExtraPoints)+1 % adding the UAV returns to the UGV for each disk
%         wantToFind = tempExtraPoints(j);
%         addLocation = find(tempHighlight == wantToFind);
%         tempHighlight = [tempHighlight(1:addLocation), tempHighlight(1), tempHighlight(addLocation+1:end)];
%         graphExtraPoints(counter,1) = tempExtraPoints(j);
%         graphExtraPoints(counter,2) = tempHighlight(1);
%         graphExtraPoints(counter,3) = tempExtraPoints(j+1);
%         counter = counter+1;
%         j = j+2;
%     end
%
%     tempHighlight = [tempHighlight, tempHighlight(1)];
%     highlight(H,tempHighlight, 'EdgeColor','b','LineWidth', 2)
%     for j = 1:counter-1
%         edgeToHighlight = graphExtraPoints(j,:);
%         highlight(H,edgeToHighlight,'EdgeColor', 'g', 'LineWidth', 2)
%     end
%     hold on;
%     h = zeros(2, 1);
%     h(1) = plot(NaN,NaN,'-b');
%     h(2) = plot(NaN,NaN,'-g');
%     legend(h,'Location','northwest','UAV Flight','UAV Traveling Back to UGV to Charge');
%     titleName = ['Baseline Method UAV flight Output' ];
%     title(titleName)
%     axis([-75, 200, 0,300]);
% end
%
% figure()
% H = plot(compG1, 'XData', x1, 'YData', y1, 'EdgeColor','w');
%
% % for i = 1:numUGVs-1
% %     tempHighlight = UGVPaths(i, :);
% %     tempHighlight(isnan(tempHighlight)) = [];
% highlight(H,trueUGVPath, 'EdgeColor','r','LineWidth', 2)
%
% hold on;
% h = zeros(1, 1);
% %     h(1) = plot(NaN,NaN,'-b');
% h(1) = plot(NaN,NaN,'-r');
% legend(h,'Location','northwest', 'UAV+UGV Travel');
% title('Baseline Method UGV Output')
% axis([-75, 200, 0,300]);
% % end
%
%
% % for i = 1:numUGVs-1 % This is for Depth First Search for UGV
% %     tempHighlight = UGVPaths(i, :);
% %     tempHighlight(isnan(tempHighlight)) = [];
% %     highlight(H,tempHighlight, 'EdgeColor','r','LineWidth', 2)
% %
% %     hold on;
% %     h = zeros(1, 1);
% %     %     h(1) = plot(NaN,NaN,'-b');
% %     h(1) = plot(NaN,NaN,'-r');
% %     legend(h,'Location','northwest', 'UAV+UGV Travel');
% %     title('Baseline Method UGV Output')
% %     axis([-75, 200, 0,300]);
% % end
%
% % Remove axis after creating graph

finalMatrix;