% graphingGTSP
% graphs the 3D GTSP problem on a 2D plane with the cluster grouping
% INPUTS
% x = x corrdinates
% y = y corrdinates
% z = z corrdinates
% numPoints = number of initial points in the graph
% numLevels = number of initial level given for the graph
% s = starting node for an edge
% t = corresponding ending node for an edge with "s"
% OUTPUTS
% this function just plots the cluster so no output is needed

function graphingGTSP(x, y, z, numPoints, numLevels, s, t)

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


[G, xOut, yOut] = graphMakingWPoints(xOut, yOut, G);
[G] = createEdges(G, s, t)

figure()                                                            % plots graph
plot(G, 'XData', xOut, 'YData', yOut, 'LineStyle', '-.');


yRec = 0;
wRec = 1;
hRec = numLevels+1;
for i = 1:numPoints                                                 % clusters the points
    xRec = i-(wRec/2);                                              % parameters for creating clusters
    pos = [xRec, yRec, wRec, hRec];                                 % creates oval, but needs to be fixed
    rectangle('Position', pos, 'Curvature', [1 1])
end


end



