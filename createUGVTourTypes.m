% createeUGVTourTypes
% creates UGV for general case
% INPUTS

% OUTPUTS


function [xNew, yNew, tourUGV] = createUGVTourTypes(x, y, tour, numPoints, numLevels, v_Type, finalMatrix)

tourUGV = [];
xNew = [];
yNew = [];
totalPoints = numPoints * numLevels;

s = [];
t = [];
for i = 1:totalPoints+1
    for j = 1:totalPoints+1
        if finalMatrix(i, j) == 1
            s(end+1) = i;
            t(end+1) = j;
        end
    end
end

sUGV = [];
tUGV = [];
numOfEdges = numel(s);
tempS = s(1);
tempT = t(1);
for i = 1:numOfEdges
    if tempS > totalPoints
        tourUGV(end+1) = tempS;
        type = 0;
    elseif tempT > totalPoints
        type = 0;
    else
        type = v_Type(tempS, tempT);
    end
    
    if type == 2
        tourUGV(end+1) = tempS;
        tourUGV(end+1) = tempT;
    elseif type == 3
        tourUGV(end+1) = tempT;
    else
        ;
    end
    
    tempS = t(find(s == tempS));
    tempT = t(find(s == tempS));
end

sizeOfTourUGV = numel(tourUGV);
for i = 1:sizeOfTourUGV
    xNew(end+1) = x(tourUGV(i));
    yNew(end+1) = y(tourUGV(i));
end







end
