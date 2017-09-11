
GLNSSolution = [2300,1585,4581,2064,2161,4354,1450,1641,4438,3432,3623,2418,613,3211,1202,1896,4189,3584,79,4972,968,3053,1141,1338,2332,4724,1720,2612,4202,897,195,3386,4674,4073,468,361,3946,2744,232,3122,1918,4810,507,2948,1039,736,2829,3818,2503,3701];
GLNSSolution = fliplr(GLNSSolution);
GLNSSolutionOriginalPoints = ceil(GLNSSolution./numBatteryLevels);

GLNSx = zeros(1,numel(x1));
GLNSy = zeros(1,numel(y1));

for a = 1:numPointsInit
    GLNSx(a) = x1(GLNSSolutionOriginalPoints(a));
    GLNSy(a) = y1(GLNSSolutionOriginalPoints(a));
end

GLNSx(end+1) = 0;
GLNSy(end+1) = 0;
GLNSg = digraph;
GLNSg = addnode(GLNSg, numel(GLNSx));

S2 = zeros(1,numel(GLNSx)-1);
T2 = S2;
for a = 1:numPointsInit
   S2(a) = a;
   T2(a) = a+1;
end

GLNSg = addedge(GLNSg,S2,T2);
GLNSPlot = plot(GLNSg,'XData',GLNSx,'YData',GLNSy);

S3 = [];
S4 = S3;
S5 = S3;
T3 = S3;
T4 = S3;
T5 = S3;

for a = 1:numPointsInit-1
    typeChecker = v_Type(GLNSSolution(a),GLNSSolution(a+1));
    if typeChecker == 1
        S3(end+1) = GLNSSolution(a);
        T3(end+1) = GLNSSolution(a+1);
    elseif typeChecker == 2
        S4(end+1) = GLNSSolution(a);
        T4(end+1) = GLNSSolution(a+1);
    elseif typeChecker == 3
        S5(end+1) = GLNSSolution(a);
        T5(end+1) = GLNSSolution(a+1);
    else
        disp('error')
    end
end

if isempty(S4) == 0
    highlight(GLNSPlot,S4, T4,'EdgeColor','r','LineWidth',10, 'LineStyle', '--')
end
if isempty(S5) == 0
    highlight(GLNSPlot,S5, T5,'EdgeColor','r','LineWidth',10, 'LineStyle', '--')
end
figure(2)
plot(GLNSg, 'XData', GLNSx, 'YData', GLNSy)