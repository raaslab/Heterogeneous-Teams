% plottingTimes
% this should plot the times/erros/all points


function [] = plottingTimes(totalAverageTimes)

clear('neg')
clear('pos')
clear('x')
clear('y')

numOfTimes = numel(totalAverageTimes(:, 1));
x = 1:numOfTimes;
y = totalAverageTimes(:, 4);
neg = totalAverageTimes(:, 5);
pos = totalAverageTimes(:, 6);
y = circshift(y, -1);
neg = circshift(neg, -1);
pos = circshift(pos, -1);

% err = 8*ones(size(y));
errorbar(x, y, neg, pos)

end