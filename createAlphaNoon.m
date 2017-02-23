% createAlphaNoon
% creates Alpha_noon for GTSP solver
% INPUTS
% v_Adj = matrix of all points with the edges and their costs
% numPoints = number of initial points
% OUTPUTS
% alpha = the penalty in noon_bean solver
% problem = means there was an error and this is not a valid run

function [alpha, problem] = createAlphaNoon(v_Adj, numPoints, v_Cluster, numLevels)

problem = 0;
v_Cluster = cell2mat(v_Cluster);

switch nargin
    case 2
        [x, y] = find(v_Adj(1, :), 1);
        newY = y;
        s = [x];
        t = [newY];
        for i = 1:numPoints-2
            oldY = newY;
            [~, y] = find(v_Adj(newY, newY:end), 1);
            newY = y+oldY-1;
            if isempty(newY)
                problem = 1;
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
        
    case 4
        totalCost = 0;
        for i = 1:numPoints-1
            fin = 0;
            pointA = find(v_Cluster == i);
            pointB = find(v_Cluster ==i+1);
            for j = 1:numLevels
                for k = 1:numLevels
                    cost = v_Adj(pointA(j), pointB(k));
                    if cost ~= 0
                        totalCost = totalCost +cost;
                        fin = 1;
                    end
                end
                if fin == 1
                    break;
                end
            end
        end
        fin = 0;
        pointA = find(v_Cluster == i+1);
        pointB = find(v_Cluster == 1);
        for j = 1:numLevels
            for k = 1:numLevels
                cost = v_Adj(pointA(j), pointB(k));
                if cost ~= 0
                    totalCost = totalCost +cost;
                    fin = 1;
                else
                    break;
                end
            end
            if fin == 1
                break;
            end
        end
        alpha = totalCost;
        
end
end