% plottingTimes
% this should plot the times/erros/all points
% INPUTS
% totalAverageTimes = array of averagetimes
% OUTPUTS
% this creates a figure of the average times

function [] = plottingTimes(totalAverageTimes)

clear('neg')
clear('pos')
clear('x')
clear('y')

totalAverageTimes(1, :) = [];
numOfTimes = numel(totalAverageTimes(:, 1));
x = 1:numOfTimes;
xNames = [];
y = totalAverageTimes(:, 4);
neg = totalAverageTimes(:, 5);
pos = totalAverageTimes(:, 6);


for i = 1:numOfTimes             % number of levels
    name = totalAverageTimes(i, 1) + (.1*totalAverageTimes(i, 2));
    xNames(end+1) = name;
end

xNames = num2str(xNames);



% err = 8*ones(size(y));

title('Computational Time')
xlabel({'Graph Input Cases', '(Initial Points, Number Of Packages)'})
ylabel({'Time', '(Seconds)'})

plot(x, y);
% set(gca, 'Xticks', x, 'XTickLabels', xNames)
hold on
plotData = errorbar(x, y, neg, pos);

end