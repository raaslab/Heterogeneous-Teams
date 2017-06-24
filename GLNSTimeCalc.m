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

x = 1:5;
figure(1)
plot(x,OURS1,x,GLNS1)
title('Changing Number of Input Sites')
figure(2)
plot(x,OURS2,x,GLNS2)
title('Changing Number of Battery Levels')