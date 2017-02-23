% gtspReconvert
% converts concorde back to my gtsp to output from gtspSolver
% INPUTS
% G = graph that gives points for tour
% tour = tour that needs to be converted back to GTSP
% v_Cluster = matrix that shows the node to cluster relationship
% v_Adj = matrix that shows the node to node (edge) relationships and the
% costs
% numLevels = number of battery levels in a graph
% OUTPUTS
% matrix = the matrix that will allow for creation of UAV/UGV tour
% finalTour = final tour shown with nodeID's

function [matrix, finalTour, problem] = concordeReconvert(G, tour, v_Cluster, v_Adj, numLevels)

problem = 0;
tableOfPoints = G.Nodes;
cellOfPoints = table2array(tableOfPoints);
doubleOfPoints = arrayfun(@(x) str2double(x), cellOfPoints, 'UniformOutput', false);
matOfPoints = cell2mat(doubleOfPoints);
floorOfPoints = floor(matOfPoints);

numOfPoints = numel(floorOfPoints);
newTour = [];
for i = 1:numOfPoints
    newTour(end+1) = floorOfPoints(tour(i));
end

doubleCluster = cell2mat(v_Cluster);

clusterTour1 = union(newTour, [], 'stable');
clusterTour2 = flipud(clusterTour1);
numOfOnlyPoints = numel(clusterTour1);
correctS1 = [];
indexOfClusters1 = [];
correctS2 = [];
indexOfClusters2 = [];


for i = 1:numOfOnlyPoints-1
    if doubleCluster(clusterTour1(i)) ~= doubleCluster(clusterTour1(i+1))
        indexOfClusters1(end+1) = i+1;
    end
end
if doubleCluster(clusterTour1(1)) ~= doubleCluster(clusterTour1(end))
    indexOfClusters1(end+1) = 1;
end
sizeOfClusterTour = numel(indexOfClusters1);
for i = 1:sizeOfClusterTour
    correctS1(end+1) = clusterTour1(indexOfClusters1(i));
end


for i = 1:numOfOnlyPoints-1
    if doubleCluster(clusterTour2(i)) ~= doubleCluster(clusterTour2(i+1))
        indexOfClusters2(end+1) = i+1;
    end
end
if doubleCluster(clusterTour2(1)) ~= doubleCluster(clusterTour2(end))
    indexOfClusters2(end+1) = 1;
end
sizeOfClusterTour = numel(indexOfClusters2);
for i = 1:sizeOfClusterTour
    correctS2(end+1) = clusterTour2(indexOfClusters2(i));
end

finalTour1 = correctS1;
finalTour2 = correctS2;

sizeOfFinalTour = numel(finalTour1);
numOfBaseStation = max(finalTour1);
locOfBase = find(finalTour1 == numOfBaseStation);
finalTour1 = circshift(finalTour1, sizeOfFinalTour - locOfBase + 1);
locOfBase = find(finalTour2 == numOfBaseStation);
finalTour2 = circshift(finalTour2, sizeOfFinalTour - locOfBase + 1);
basePOne = finalTour1(2);
basePTwo = finalTour2(2);
if(mod(basePOne, numLevels) == 1 && mod(basePTwo, numLevels) == 1)
    problem = 1;
    finalTour = finalTour1;
elseif(mod(basePOne, numLevels) == 1)
    finalTour = finalTour1;
elseif(mod(basePTwo, numLevels) == 1)
    finalTour = finalTour2;
else
    problem = 2;
    finalTour = finalTour1;
end

correctS = finalTour;
correctT = finalTour;
correctT = circshift(correctT, -1);
numOfEdges = numel(correctS);
matrix = zeros(numOfOnlyPoints);

for i = 1:numOfEdges
    matrix(correctS(i), correctT(i)) = 1;
end

end
