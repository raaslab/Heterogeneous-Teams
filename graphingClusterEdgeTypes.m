% graphingGTSP
% graphs the 3D GTSP problem on a 2D plane with the cluster grouping
% INPUTS
% x = x corrdinates
% y = y corrdinates
% numPoints = number of initial points in the graph
% numLevels = number of initial level given for the graph
% s = starting node for an edge
% t = corresponding ending node for an edge with "s"
% id = name of nodes within graph
% withBaseStation = character array that states if it has a base station
% 'yes' or it doesn't have one anything else
% id = the names of the points
% OUTPUTS
% this function just plots the cluster so no output is needed

% function [xOut, yOut] = graphingCluster(x, y, numPoints, numLevels, s, t, withBaseStation, id)

% inputs
withBaseStation = 'yes';
numPoints = 2;
numLevels = 5;
nodeArray = [];

for i = 1:numPoints*numLevels
    nodeArray(end+1) = i;
end
nodeArray = nodeArray';


xOut = [];
yOut = [];

G = digraph;
for i = 1:numPoints
    count = numLevels;
    for j = 1:numLevels
        xOut(end+1) = i;
        yOut(end+1) = count;
        count = count-1;
    end
end

[G, xOut, yOut] = graphMakingWPoints(xOut, yOut, G, nodeArray);

s1 = [1,2,3,4]
t1 = [7,8,9,10]
% create type 1 edges
% s1 = [1, 2, 3, 4];
% t1 = [7, 8, 9, 10];
% create type 2 edges
% s2 = [14, 14, 14, 14];
% t2 = [16, 17, 18, 19];
% create type 3 edges
% s3 = [24, 24, 24, 24, 24];
% t3 = [26 ,27 ,28, 29, 30];

[G] = createEdges(G, s1, t1);
% [G] = createEdges(G, s2, t2);
% [G] = createEdges(G, s3, t3);

if strcmp(withBaseStation, 'yes')
    xOut(end+1) = 0;
    yOut(end+1) = 0;
    G = addnode(G, '31');
end

figure()                                                            % plots graph
h = plot(G, 'XData', xOut, 'YData', yOut, 'LineStyle', '-', 'LineWidth', 2, 'MarkerSize', 2, 'EdgeAlpha', 1,'ArrowSize', 15, 'EdgeColor', 'b');
axis([0.5, 2.5, 0, 6]);
% create type 1 edges
% s1 = [1, 2, 3, 4];
% t1 = [7, 8, 9, 10];
% highlight(h, s1, t1, 'EdgeColor', 'r');
% create type 2 edges
% s2 = [14, 14, 14, 14];
% t2 = [16, 17, 18, 19];
% highlight(h, s2, t2, 'EdgeColor', 'g');
% create type 3 edges
% s3 = [24, 24, 24, 24, 24];
% t3 = [26 ,27 ,28, 29, 30];
% highlight(h, s3, t3, 'EdgeColor', 'b');

yRec = 0;
wRec = 1;
hRec = numLevels+1;
skinny = 0.25
for i = 1:numPoints                                                 % clusters the points
    xRec = i-(wRec/2);                                              % parameters for creating clusters
    pos = [xRec+skinny/2, yRec+skinny/2, wRec-skinny, hRec-skinny];                                 % creates oval, but needs to be fixed
    rectangle('Position', pos, 'Curvature', [1 1])
    %     xStr = num2str(x(i));
    %     yStr = num2str(y(i));
    %     str = sprintf('%s, %s', xStr, yStr);
    %     text(xRec, yRec+hRec-(hRec/16), str, 'Color', 'red', 'Fontsize', 7);
end
labelnode(h,[1,2,3,4,5,6,7,8,9,10],{'100%', '80%', '60%', '40%', '20%','100%', '80%', '60%', '40%', '20%'})
xticks([0,1,2])
xticklabels({'h=0i','g_i','g_j'})
yticks([])
title('Type 1', 'FontSize', 14)
% labelnode(h,[1:31],{' '})

fname = 'EdgeTypes';

saveas(gcf,[fname,'.eps'],'epsc');

system(['epstopdf',' ',[fname,'.eps']]);

system(['pdfcrop',' ',[fname,'.pdf']]);

system(['mv',' ',[fname,'-crop.pdf'],' ',[fname,'.pdf']]);

