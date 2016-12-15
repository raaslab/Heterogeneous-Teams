% graphingGTSP
% graphs the 3D GTSP problem on a 2D plane with the cluster grouping
% INPUTS

% OUTPUTS

% Use function "boundary" to encircle points.

function [G, xOut, yOut] = graphingGTSP(x, y, z, numPoints, numLevels)

xOut = [];
yOut = [];

G = digraph;
% yOut = z;
for i = 1:numPoints
    count = numLevels;
    for j = 1:numLevels
        xOut(end+1) = i;
        yOut(end+1) = count;
        count = count-1;
    end
end

[G, xOut, yOut] = graphMakingWPoints(xOut, yOut, G);






end




