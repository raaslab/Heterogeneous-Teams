
GLNSSolution = [1550, 2194, 1590, 1381, 628, 1276, 1819, 1868, 16, 313, 660, 405, 298, 896, 1991, 1788, 2082, 576, 1424, 171, 1720, 1918, 66, 710, 909, 952, 2150, 1499, 1147, 1695, 1342, 1189, 135, 2379, 2278, 2320, 2463, 1008, 206, 2202, 800, 1647, 1094, 491, 535, 828, 367, 1214, 2011, 2401, 2501];


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
% GLNSPlot = plot(GLNSg,'XData',GLNSx,'YData',GLNSy, 'LineWidth',4);



% hold on
% highlight edges for UAV
% if isempty(S4) == 0                 %highlight type 2 edges
%     highlight(GLNSPlot,S4, T4,'EdgeColor','r','LineWidth',4, 'LineStyle', '--')
% end
% if isempty(S5) == 0                 %highlight type 3 edges
%     highlight(GLNSPlot,S5, T5,'EdgeColor','r','LineWidth',4, 'LineStyle', '--')
% end
% highlighting edges for UGV
% highlight(GLNSPlot, S6, T6, 'EdgeColor', 'r', 'LineWidth', 4)

% highlight(GLNSPlot, S2)             %highlights nodes
% highlight(GLNSPlot, numel(S2)+1)    %highlights last node

