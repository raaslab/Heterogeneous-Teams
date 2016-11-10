% tableMaking
% function creates a table to allow for the creation of the GTSP

function tableMaking(x, y, numBatteryLevels)
xTemp = transpose(x)
yTemp = transpose(y)

groupNames = {'g1'; 'g2'; 'g3'}
T = table(xTemp, yTemp, 'RowNames', groupNames) 



end