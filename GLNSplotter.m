
GLNSSolution = [1899, 994, 788, 2784, 4571, 62, 158, 2946, 2238, 4430, 1117, 310, 4608, 1293, 1488, 1585, 2380, 3077, 3970, 4863, 2160, 4254, 3646, 642, 1340, 2632, 3418, 510, 805, 3301, 3898, 3196, 1088, 4082, 478, 4770, 2559, 4151, 4348, 2437, 1634, 3728, 1919, 3210, 2806, 1702, 4932, 3524, 2012, 201, 5001]


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

