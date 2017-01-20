% createXYPoints
% creates the XY points for plot with base station
% INPUTS
% x = x point matrix with previous points
% y = y points that correspond to x
% OUTPUTS
% x = x point matrix with base station now
% y = y points that correspond to x

function [x, y] = createBaseStationPoint(x, y)

x(end+1) = 0;
y(end+1) = 0;

end