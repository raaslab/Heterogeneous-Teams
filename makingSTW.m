% makingSTW
% makes the input arrays for creatEdges (S, T, W)
% INPUTS
%
% OUTPUTS
%

function [S, T, weights] = makingSTW(numPoints, numLevels)

S = [];
T = [];
weights = [];
totalPoints = numPoints * numLevels;
for i = 1:totalPoints
    for j = (-numPoints):(numPoints-1)
        leftOver = mod(i, numLevels);
        S(end+1) = i;
        T(end+1) = i + (numLevels*j)+1;
    end
end


end