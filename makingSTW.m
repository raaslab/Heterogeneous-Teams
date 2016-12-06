% makingSTW
% makes the input arrays for creatEdges (S, T, W)
% INPUTS
% numPoints = number of nodes in a graph
% numLevels = number of battery levels in a graph
% OUTPUTS
% S = array of starting points for edges
% T = array of ending points for edges
% weights = array of corresponding weights for each edge

function [S, T, weights] = makingSTW(numPoints, numLevels)

S = [];
T = [];
weights = [];
newS = [];
newT = [];
newWeights = [];
totalPoints = numPoints * numLevels;
for i = 1:totalPoints
    for j = (-numPoints):(numPoints-1)
        S(end+1) = i;
        T(end+1) = i + (numLevels*j)+1;
        weights(end+1) = 1;
    end
end
count1=0;
count2=0;
totalMatches = numel(S);
for i = 1:totalMatches
    if (1 <= T(i)) && (T(i) <= totalPoints)
        count1 = count1+1;
        if (T(i)-1 ~= S(i)) && (S(i) ~= T(i)+1)
            count2 = count2+1;
            newS(end+1) = S(i);
            newT(end+1) = T(i);
            newWeights(end+1) = 1;
        end
    end
end

S = newS';
T = newT';
weights = newWeights';

end

