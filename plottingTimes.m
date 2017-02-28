% plottingTimes
% this should plot the times/erros/all points
% INPUTS
% totalAverageTimes = array of averagetimes
% OUTPUTS
% this creates a figure of the average times

function [] = plottingTimes(totalAverageTimes)

figure;
hold on;
for i = 3:10
    location = find(totalAverageTimes(:, 2) == i);
    numOfPoints = numel(location);
    x = [];
    y = [];
    neg = [];
    pos = [];
    for j = 1:numOfPoints
        x(end+1) = totalAverageTimes(location(j), 1);
        y(end+1) = totalAverageTimes(location(j), 4);
        neg(end+1) = totalAverageTimes(location(j), 5);
        pos(end+1) = totalAverageTimes(location(j), 6);
    end
    label = num2str(i);
    plotData = plot(x, y, 'DisplayName', label);
    %     plotData = errorbar(x, y, neg, pos);
    hold on;
end

lgd = legend('show');
title(lgd,'Battery Levels')
title('Computational Time')
xlabel({'Number of Initial Poitns'})
ylabel({'Time', '(Seconds)'})
axis([6 21 0 750]);

end