% createUGVTour
% this function creates the tour for the UGV, which is a subset of the tour
% created for the UAV. (GTSP solver output)
% INPUT
% x = GTSP points
% y = GTSP points that correspond to x
% tour = final tour from the GTSP solver
% numLevels = number of battery levels in a graph
% OUTPUT
% xNew = simplified original points
% yNew = simplified original points that correspond to x
% tourUGV = nodes for the UGV tour

function [xNew, yNew, tourUGV] = createUGVTour(x, y, tour, numLevels)

tourUGV = [];
sizeOfTour = numel(tour);
xNew = [];
yNew = [];

for i = 1:sizeOfTour
    if mod(tour(i), numLevels) == 1
        tourUGV(end+1) =  tour(i);
    end
end

sizeOfTourUGV = numel(tourUGV);
for i = 1:sizeOfTourUGV
    xNew(end+1) = x(tourUGV(i));
    yNew(end+1) = y(tourUGV(i));
end

end

