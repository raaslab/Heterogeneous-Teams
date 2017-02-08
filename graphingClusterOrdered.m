% graphingClusterOrdered
% this creates the cluster graph of the tour, but plots it in order of what
% ever cluster is next
% INPUTS
% x = x corrdinates for GTSP points
% y = y corrdinates corresponding to "x"
% numPoints = number of initial points in the graph
% numLevels = number of initial level given for the graph
% s = starting node for an edge
% t = corresponding ending node for an edge with "s"
% v_Cluster = tells you points corresponding to clusters
% tour = this is the final tour from concorde
% OUTPUTS
% this function just plots the cluster so no output is needed


function [] = graphingClusterOrdered(x, y, numPoints, numLevels, s, t, v_Cluster, tour)

xOut = [];
yOut = [];

G = digraph;
for i = 1:numPoints
    count = numLevels;
    for j = 1:numLevels
        xOut(end+1) = i;
        yOut(end+1) = count;
        count = count-1;
    end
end
%-------------------------------------------------------------------------%
% need to make id variable
id = [];
numOfTour = numel(tour);
newV_Cluster = cell2mat(v_Cluster);
for i = 2:numOfTour
    locationOfNodes = find(newV_Cluster == newV_Cluster(tour(i)));
    numOfLocationOfNodes = numel(locationOfNodes);
    for j = 1:numOfLocationOfNodes
       id(end+1) = locationOfNodes(j);
    end
end
%-------------------------------------------------------------------------%
[G, xOut, yOut] = graphMakingWPoints(xOut, yOut, G, id);
[G] = createEdges(G, s, t);

xOut(end+1) = 0;
yOut(end+1) = 0;

figure(4)                                                            % plots graph
plot(G, 'XData', xOut, 'YData', yOut, 'LineStyle', '-.', 'LineWidth', 2, 'MarkerSize', 2);

yRec = 0;
wRec = 1;
hRec = numLevels+1;
for i = 1:numPoints                                                 % clusters the points
    xRec = i-(wRec/2);                                              % parameters for creating clusters
    pos = [xRec, yRec, wRec, hRec];                                 % creates oval, but needs to be fixed
    rectangle('Position', pos, 'Curvature', [1 1])
    xStr = num2str(x(tour(i+1)));
    yStr = num2str(y(tour(i+1)));
    str = sprintf('%s, %s', xStr, yStr);
    text(xRec, yRec+hRec-(hRec/16), str, 'Color', 'red', 'Fontsize', 7);
end

end

