GLNSAvgTime(1:9) = 0;
OURSAvgTime(1:9) = 0;

for i = 1:9
    GLNSAvgTime(i) = mean(GLNS(:,i));
    OURSAvgTime(i) = mean(OURS(:,i));
end


GLNS1 = [GLNSAvgTime(1),GLNSAvgTime(2),GLNSAvgTime(3),GLNSAvgTime(4),GLNSAvgTime(5)];
GLNS2 = [GLNSAvgTime(6),GLNSAvgTime(2),GLNSAvgTime(7),GLNSAvgTime(8),GLNSAvgTime(9)];
OURS1 = [OURSAvgTime(1),OURSAvgTime(2),OURSAvgTime(3),OURSAvgTime(4),OURSAvgTime(5)];
OURS2 = [OURSAvgTime(6),OURSAvgTime(2),OURSAvgTime(7),OURSAvgTime(8),OURSAvgTime(9)];

ynegGLNS = min(GLNS);
yposGLNS = max(GLNS);
ynegGLNS1 = [ynegGLNS(1),ynegGLNS(2),ynegGLNS(3),ynegGLNS(4),ynegGLNS(5)];
ynegGLNS2 = [ynegGLNS(6),ynegGLNS(2),ynegGLNS(7),ynegGLNS(8),ynegGLNS(9)];
yposGLNS1 = [yposGLNS(1),yposGLNS(2),yposGLNS(3),yposGLNS(4),yposGLNS(5)];
yposGLNS2 = [yposGLNS(6),yposGLNS(2),yposGLNS(7),yposGLNS(8),yposGLNS(9)];


ynegOURS = min(GLNS);
yposOURS = max(GLNS);
ynegOURS1 = [ynegOURS(1),ynegOURS(2),ynegOURS(3),ynegOURS(4),ynegOURS(5)];
ynegOURS2 = [ynegOURS(6),ynegOURS(2),ynegOURS(7),ynegOURS(8),ynegOURS(9)];
yposOURS1 = [yposOURS(1),yposOURS(2),yposOURS(3),yposOURS(4),yposOURS(5)];
yposOURS2 = [yposOURS(6),yposOURS(2),yposOURS(7),yposOURS(8),yposOURS(9)];


xneg = [];
xpos = [];
x = 1:5;
figure(1)
% plot(x,OURS1,x,GLNS1, 'LineWidth', 2)
errorbar(x,OURS1,ynegOURS1,yposOURS1,xneg,xpos, 'LineWidth', 2)
hold on;
errorbar(x,GLNS1,ynegGLNS1,yposGLNS1,xneg,xpos, 'LineWidth', 2)
title('Changing Number of Input Sites (Battery Level = 4)', 'FontSize', 10)
xlabel('Number of Input Sites', 'FontSize', 10)
ylabel('Computational Time (s)', 'FontSize', 10)

figure(2)
% plot(x,OURS2,x,GLNS2, 'LineWidth', 2)
errorbar(x,OURS2,ynegOURS2,yposOURS2,xneg,xpos, 'LineWidth', 2)
hold on;
errorbar(x,GLNS2,ynegGLNS2,yposGLNS2,xneg,xpos, 'LineWidth', 2)
title('Changing Number of Battery Levels (Input Sites = 12)', 'FontSize', 10)
xlabel('Number of Battery Levels', 'FontSize', 10)
ylabel('Computational Time (s)', 'FontSize', 10)