clc
close all
clear


x=[1,2,3,2.75,2]
x1=[1,2.75,2]
x2=[2,3]
y=[3,4.25,3.5,2,1]
y1=[3,2,1]
y2=[4.25,3.5]


s = [1,2,3,4]
t = [2,3,4,5]
weights = [1, 1, 1, 1]
nodenames = {'h','i','j','k'}
names = ['y_hi', 'y_ij', 'y_jk', 'y_kl'];
G = digraph(s,t, weights, nodenames)
figure(1)
plot(G)
plot(G,'XData',x,'YData',y,'EdgeLabel',G.Edges.Weight)
G.Nodes.Name
axis([0 4 0 6])


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