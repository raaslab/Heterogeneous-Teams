% creatingTotalAverageTimes
% this creates teh variable totalAverageTimes, which allows us to see the
% different average times for the different combinations

load matlab.mat
points = union(time(:, 1), []);
levels = union(time(:, 2), []);
runs = union(time(:, 3), []);
numPoints = numel(points);
numLevels = numel(levels);
numRuns = numel(runs);
totalAverageTimes = [0, 0, 0, 0, 0, 0];
for i = 1:numPoints
    for j = 1:numLevels
        totalTime = 0;
        arrayOfTimes = [];
        for k = 1:numRuns
            indexOfLocations = find(time(:, 1) == points(i) & time(:, 2) == levels(j) & time(:, 3) == runs(k));
            numIndexOfLocations = numel(indexOfLocations);
            for l = 1:numIndexOfLocations
                totalTime = totalTime + time(indexOfLocations, 4);
            end
            arrayOfTimes(end+1) = time(indexOfLocations, 4);
        end
        averageTime = totalTime / k;
        neg = min(arrayOfTimes) - averageTime;
        pos = max(arrayOfTimes) - averageTime;
        totalAverageTimes(end+1, :) = [points(i), levels(j), runs(k), averageTime, neg, pos];
    end
end

