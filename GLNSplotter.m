
GLNSSolution = [3898, 1690, 885, 2579, 768, 1364, 961, 4660, 158, 2853, 248, 1233, 427, 3323, 3214, 1507, 3906, 2001, 4295, 3789, 1883, 2676, 4174, 1469, 1065, 4856, 346, 4542, 3636, 633, 4724, 2719, 2212, 1901, 4388, 80, 4973, 3465, 560, 2455, 2148, 2938, 2336, 1125, 4416, 4032, 1720, 3113, 3007, 3501, 5001]


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

