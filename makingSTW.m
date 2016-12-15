% makingSTW
% makes the input arrays for creatEdges (S, T, W)
% INPUTS
% numPoints = number of nodes in a graph
% numLevels = number of battery levels in a graph
% OUTPUTS
% S = array of starting points for edges
% T = array of ending points for edges
% weights = array of corresponding weights for each edge

function [S, T, weights] = makingSTW(x, y, z, numPoints, numLevels)

S = [];
T = [];
weights = [];
newS1 = [];
newT1 = [];
newS2 = [];
newT2 = [];
newWeights = [];
totalPoints = numPoints * numLevels;

for i = 1:totalPoints                       % Creates all possible edges
    for j = (-numPoints):(numPoints-1)
        S(end+1) = i;                       % The if function is not indexing the right two points that need to be compared
        T(end+1) = i + (numLevels*j)+1;     % Might need to change this function so that I can index the right things or create another loop that goes through the points systematically based off of "x" and "y" instead of numPoints and numLevels.
        weights(end+1) = 1;
    end
end


count1=0;
count2=0;
totalMatches = numel(S);
for i = 1:totalMatches                      % Gets rid of negative index's on edges
    if (1 <= T(i)) && (T(i) <= totalPoints)
        count1 = count1+1;
        if (S(i) ~= T(i)+1)
            count2 = count2+1;
            newS1(end+1) = S(i);
            newT1(end+1) = T(i);
            newWeights(end+1) = 1;
        end
    end
end


count3 = 0;
numS1 = numel(newS1);
for i = 1:(numS1)
%     for j = (i+1):numS1
        if (x(newS1(i)) ~= x(newT1(i))) && (y(newS1(i)) ~= y(newT1(i)))
            newS2(end+1) = newS1(i);
            newT2(end+1) = newT1(i);
            
            count3 = count3 + 1;
        end
%     end
end
count3
S = newS2';
T = newT2';
% S = S';
% T = T';
weights = newWeights';

end

