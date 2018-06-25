close all
clear

load('comparisonTSP.mat')

x = [50,40,30];
y1 = [mean(data(:,1)), mean(data(:,3)), mean(data(:,5))];
y2 = [mean(data(:,2)), mean(data(:,4)), mean(data(:,6))];
y1neg = [min(data(:,1))-mean(data(:,1)), min(data(:,3))-mean(data(:,3)), min(data(:,5))-mean(data(:,5))];
y1pos = [max(data(:,1))-mean(data(:,1)), max(data(:,3))-mean(data(:,3)), max(data(:,5))-mean(data(:,5))];
y2neg = [min(data(:,2))-mean(data(:,2)), min(data(:,4))-mean(data(:,4)), min(data(:,6))-mean(data(:,6))];
y2pos = [max(data(:,2))-mean(data(:,2)), max(data(:,4))-mean(data(:,4)), max(data(:,6))-mean(data(:,6))];
errorbar(x,y1,y1neg, y1pos, 'LineWidth', 2.5, 'Color', 'b');
hold on
errorbar(x,y2,y2neg, y2pos, 'LineWidth', 2.5, 'Color', 'r');
ttl = sprintf('Comparison of Proposed and Baseline Methods');
title(ttl,'FontSize', 12)
xlabel('Number of Random Input Sites','FontSize', 12)
ylabel('Cost (UAV Travel Time)','FontSize', 12)
legend('Location','northwest','Proposed Method', 'Baseline Method')
axis([25 55 600 2200])