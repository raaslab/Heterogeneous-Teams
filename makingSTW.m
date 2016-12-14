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
newS = [];
newT = [];
newWeights = [];
totalPoints = numPoints * numLevels;

for i = 1:totalPoints
    for j = (-numPoints):(numPoints-1)
        if ((x(i) ~= x(j)) && (y(i) ~= y(j)))   % PROBLEM RIGHT HERE
            S(end+1) = i;                       % The if function is not indexing the right two points that need to be compared
            T(end+1) = i + (numLevels*j)+1;     % Might need to change this function so that I can index the right things or create another loop that goes through the points systematically based off of "x" and "y" instead of numPoints and numLevels.
            weights(end+1) = 1;
        end
    end
end
% count1=0;
% count2=0;
% totalMatches = numel(S);
% for i = 1:totalMatches
%     if (1 <= T(i)) && (T(i) <= totalPoints)
%         count1 = count1+1;
%         if (S(i) ~= T(i)-1) && (S(i) ~= T(i)+1)
%             count2 = count2+1;
%             newS(end+1) = S(i);
%             newT(end+1) = T(i);
%             newWeights(end+1) = 1;
%         end
%     end
% end

% S = newS';
% T = newT';
S = S';
T = T';
weights = newWeights';

end

