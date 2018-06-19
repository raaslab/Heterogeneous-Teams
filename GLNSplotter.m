clear
close all
load 0rando1.mat
GLNSSolution = [2693, 2381, 676, 2571, 2168, 260, 4655, 4950, 1047, 141, 3035, 4331, 425, 4715, 3104, 1285, 3272, 3859, 1753, 1546, 2239, 3334, 1127, 823, 4517, 309, 2805, 3701, 2991, 2487, 1876, 2067, 964, 556, 1647, 4443, 3436, 4126, 4225, 3922, 2713, 1310, 4002, 4849, 1942, 1437, 24, 711, 3605, 3501, 5001]



GLNSSolution = fliplr(GLNSSolution);
GLNSSolutionOriginalPoints = ceil(GLNSSolution./numBatteryLevels);

GLNSx = zeros(1,numel(x1));
GLNSy = zeros(1,numel(y1));

for a = 1:numPointsInit
    if GLNSSolutionOriginalPoints(a) > numel(x1)
        
    else
        GLNSx(a) = x1(GLNSSolutionOriginalPoints(a));
        GLNSy(a) = y1(GLNSSolutionOriginalPoints(a));
    end
end

% GLNSx(end+1) = 0;
% GLNSy(end+1) = 0;
GLNSg = digraph;
GLNSg = addnode(GLNSg, numel(GLNSx));
figure(1)
plot(GLNSx, GLNSy,'.')
axis equal
title('Initial Graph Without Edge Costs Edges are Euclidean Distance Between Points')
S2 = zeros(1,numel(GLNSx)-1);
T2 = S2;
for a = 1:numPointsInit-1
    S2(a) = a;
    T2(a) = a+1;
end

GLNSg = addedge(GLNSg,S2,T2);

S3 = [];
S4 = S3;
S5 = S3;
T3 = S3;
T4 = S3;
T5 = S3;

for a = 1:numPointsInit-1
    if GLNSSolutionOriginalPoints(a) > numel(x1)
        
    else
        typeChecker = v_Type(GLNSSolution(a),GLNSSolution(a+1));
        if typeChecker == 1
            S3(end+1) = a;
            T3(end+1) = a+1;
        elseif typeChecker == 2
            S4(end+1) = a;
            T4(end+1) = a+1;
        elseif typeChecker == 3
            S5(end+1) = a;
            T5(end+1) = a+1;
        else
            disp('error')
        end
    end
end

S6 = [];
T6 = [];
for a = 1:numel(S4)-1                 %creating UGV edges
    S6(end+1) = T4(a);
    T6(end+1) = S4(a+1);
end

GLNSg = addedge(GLNSg,S6,T6);
figure(2)
GLNSPlot = plot(GLNSg,'XData',GLNSx,'YData',GLNSy, 'LineWidth',4);
axis equal



hold on
% highlight edges for UAV
if isempty(S4) == 0                 %highlight type 2 edges
    highlight(GLNSPlot,S4, T4,'EdgeColor','r','LineWidth',4, 'LineStyle', '-')
end
if isempty(S5) == 0                 %highlight type 3 edges
    highlight(GLNSPlot,S5, T5,'EdgeColor','r','LineWidth',4, 'LineStyle', '-')
end
% highlighting edges for UGV
highlight(GLNSPlot, S6, T6, 'EdgeColor', 'r', 'LineWidth', 4)

highlight(GLNSPlot, S2)             %highlights nodes
highlight(GLNSPlot, numel(S2)+1)    %highlights last node

