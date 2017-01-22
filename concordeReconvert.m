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

function [matrix, finalTour] = concordeReconvert(G, tour, v_Cluster, v_Adj, numLevels)

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

clusterTour = union(newTour, [], 'stable');
numOfOnlyPoints = numel(clusterTour);
doubleCluster = cell2mat(v_Cluster);
correctS = [];
correctT = [];

for i = 1:numOfOnlyPoints-1
    if doubleCluster(clusterTour(i)) == doubleCluster(clusterTour(i+1))
        ;
    else
        if clusterTour(i)-1 == 0
            correctS(end+1) = clusterTour(i)+numLevels-1;
            correctT(end+1) = clusterTour(i+1);
        else
            if doubleCluster(clusterTour(i)) == doubleCluster(clusterTour(i)-1)
                correctS(end+1) = clusterTour(i)-1;
                correctT(end+1) = clusterTour(i+1);
            else
                correctS(end+1) = clusterTour(i)+numLevels-1;
                correctT(end+1) = clusterTour(i+1);
            end
        end
    end
end

if doubleCluster(clusterTour(end)) == doubleCluster(clusterTour(1))
    ;
else
    correctS(end+1) = clusterTour(end);
    correctT(end+1) = clusterTour(1);
end

numOfEdges = numel(correctS);
for i = 1:numOfEdges
    if correctS(i) > numOfOnlyPoints
        correctS(i) = numOfOnlyPoints;
    end
end

if correctS(1) ~= correctT(end)
    clusterTour = flipud(clusterTour);
    correctS = [];
    correctT = [];
    for i = 1:numOfOnlyPoints-1
        if doubleCluster(clusterTour(i)) == doubleCluster(clusterTour(i+1))
            
        else
            if clusterTour(i)-1 == 0
                correctS(end+1) = clusterTour(i)+numLevels-1;
                correctT(end+1) = clusterTour(i+1);
            else
                if doubleCluster(clusterTour(i)) == doubleCluster(clusterTour(i)-1)
                    correctS(end+1) = clusterTour(i)-1;
                    correctT(end+1) = clusterTour(i+1);
                else
                    correctS(end+1) = clusterTour(i)+numLevels-1;
                    correctT(end+1) = clusterTour(i+1);
                end
            end
        end
    end
    
    if doubleCluster(clusterTour(end)) == doubleCluster(clusterTour(1))
        
    else
        correctS(end+1) = clusterTour(end);
        correctT(end+1) = clusterTour(1);
    end
    
    numOfEdges = numel(correctS);
    for i = 1:numOfEdges
        if correctS(i) > numOfOnlyPoints
            correctS(i) = numOfOnlyPoints;
        end
    end
end

finalTour = correctS;
finalTour(end+1) = correctT(end);

matrix = zeros(numOfOnlyPoints);
for i = 1:numOfEdges
    matrix(correctS(i), correctT(i)) = 1;
end

end
