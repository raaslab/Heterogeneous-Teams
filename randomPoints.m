% randomPoints
% creates a random point within a circle of radius "rc" and center (x1, y1)
% INPUTS
% x1 = x corrdinate of center point
% y1 = y corrdinate of center point
% rc = radius of cirle centered at (x1, y1)
% OUTPUTS
% x = x corrdinate of random point
% y = y corrdinate of random point


function [x, y] = randomPoints(x1,y1,rc)
%the function, must be on a folder in matlab path
a=2*pi*rand;
r=sqrt(rand);
x=(rc*r)*cos(a)+x1
y=(rc*r)*sin(a)+y1
end
% %to test the function
% clf
% axis equal
% hold on
% x1=1
% y1=1
% rc=1
% [x,y,z] = cylinder(rc,200);
% plot(x(1,:)+x1,y(1,:)+y1,'r')
% for t=1:1000 %loop until doing 1000 points inside the circle
%     [x y]=cirrdnPJ(x1,y1,rc)
%     plot(x,y,'x')
%     %pause(0.01) %if you want to see the point being drawn
% end