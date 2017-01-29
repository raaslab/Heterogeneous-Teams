% createAlphaNoon
% creates Alpha_noon for GTSP solver
% INPUTS
% v_Adj = matrix of all points with the edges and their costs
% numPoints = number of initial points
% OUTPUTS
% alpha = the penalty in noon_bean solver
% problem = means there was an error and this is not a valid run

function [alpha, problem] = createAlphaNoon(v_Adj, numPoints)

problem = 1;
[x, y] = find(v_Adj(1, :), 1);
newY = y;
s = [x];
t = [newY];
for i = 1:numPoints-2
    oldY = newY;
    [~, y] = find(v_Adj(newY, newY:end), 1);
    newY = y+oldY-1;
    if isempty(newY)
        problem = 0;
        break;
    end
    s(end+1) = oldY;
    t(end+1) = newY;
end
if (isempty(newY)==0)
    s(end+1) = newY;
    t(end+1) = 1;
end

cost = 0;
numEdges = numel(s);
for i = 1:numEdges
    cost = cost + v_Adj(s(i), t(i));
end

alpha = cost;

end