% rotatePoints
% rotates "originalPoints" by "rotation
% INPUTS
% OriginalPoints = 3 x numPoints matrix of [x;y;0]
% rotation = amount of rotation in degrees
% OUTPUTS
% rotatedPoints = rotated points by "rotation"

function rotatedPoints = rotatePoints(originalPoints, rotation)

rotation = deg2rad(rotation);
rotationMatrix = [cos(rotation), -sin(rotation), 0; sin(rotation), cos(rotation), 0; 0, 0, 1];
rotatedPoints = rotationMatrix*originalPoints;

% figure()
% plot(originalPoints(1,:), originalPoints(2,:))
% axis([0,10,0,10]);
% figure()
% plot(rotatedPoints(1,:), rotatedPoints(2,:))
% axis([0,10,0,10]);