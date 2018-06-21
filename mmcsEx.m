clc
close all
clear

x=[1,2,3,2.75,2];
x1=[1,2.75,2];
x2=[2,3];
y=[3,4.25,3.5,2,1];
y1=[3,2,1];
y2=[4.25,3.5];


s = [1,2,3,4];
t = [2,3,4,5];
weights = [1, 1, 1, 1];
% nodenames = {'h','i','j','k'}
% names = ['y_hi', 'y_ij', 'y_jk', 'y_kl'];
G = digraph(s,t, weights);
figure(1)
% plot(G)
h = plot(G,'XData',x,'YData',y,'LineWidth',3, 'ArrowSize', 15, 'EdgeColor', 'b', 'EdgeAlpha', 1);
labelnode(h,[1 2 3 4 5],{'h' 'i' 'j' 'k' 'l'})
title('UGV Example Edges', 'FontSize', 14)
set(gca, 'xtick', []);
set(gca, 'ytick', []);
% G.Nodes.Name
axis([0.5 4 0.75 4.5])
arrowS = [0.25 0.32];
arrowT = [0.8 0.7];
annotation('textarrow',arrowS,arrowT,'String','g_{hi} = 1','LineWidth',2, 'FontSize', 12)

arrowS = [0.7 0.62];
arrowT = [0.8 0.76];
annotation('textarrow',arrowS,arrowT,'String','g_{ij} = 1','LineWidth',2, 'FontSize', 12)

arrowS = [0.8 0.66];
arrowT = [0.5 0.55];
annotation('textarrow',arrowS,arrowT,'String','g_{jk} = 1','LineWidth',2, 'FontSize', 12)

arrowS = [0.75 0.59];
arrowT = [0.25 0.32];
annotation('textarrow',arrowS,arrowT,'String','g_{kl} = 1','LineWidth',2, 'FontSize', 12)

% change
% line width = 1
% alpha = 1
% arrow size = 15

% figure(1)
% hold on
% h = plot(x, y)
% set(h,'linewidth',5);
% set(h,'markersize', 15);
% axis([0 4 0 6])


% figure(2)
% hold on
% h2 = plot(x2, y2, 'g')
% h1 = plot(x, y, '.b')
% names = [1, 2, 3, 4, 5]
% node_names = {'a', 'b', 'c', 'd', 'e'}
% labelnode(h2,names,node_names)


% set(h1, 'linewidth', 5);
% set(h2, 'linewidth', 5);
% set(h1,'markersize', 15);
% set(h2,'markersize', 15);
% for i = 1:4
%     xtemp = [x(i), x(i+1)]
%     ytemp = [y(i), y(i+1)]
% plot(xtemp,ytemp)
% end
% axis([0 4 0 6])

% s = 1
% t = 2
% H = addedge(G, s, t)