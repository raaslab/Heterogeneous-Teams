
GLNSSolution = [120,9,164,67,61,594,267,23,661,137,397,90,456,79,521,452,159,132,99,2,248,494,572,349,337,184,360,144,334,34,197,443,213,606,299,657,302,611,423,508,180,258,169,366,577,550,54,678,645,408,584,627,320,440,323,191,556,389,684,118,288,562,262,354,432,503,43,226,598,529,488,517,414,240,276,235,670,20,309,72,381,480,40,643,687,219,150,634,474,377,107,206,536,544,699,402,620,285,97,469,701];
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
plot(GLNSg,'XData',GLNSx,'YData',GLNSy)

S3 = [];
S4 = S3
S5 = S3

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
        print('error')
    end
end

highlight(h,S4, T4,'EdgeColor','r','LineWidth',1.5, 'LineStyle', '--')