open EdgeTypes.fig
% axis equal;
% xlim([-75,125])

ca = gca;

% ca.Children.LineWidth = 2;
% ca.Children.ArrowSize = 10;
% ca.Children.MarkerSize = 6;

% ca.Children.NodeLabel = '';
for i = 1 : 1 : length(ca.Children(end).XData)-1
    %     textOnGraph = (100/5) * ca.Children(end).YData(i);
    textOnGraph = ['x_' num2str(ca.Children(end).XData(i)) '^' num2str(ca.Children(end).YData(i))];
    text(ca.Children(end).XData(i) - .15, ca.Children(end).YData(i) + .35, textOnGraph, 'FontSize', 14)
end
% text(ca.Children(end).XData(1) + 1.5, ca.Children(end).YData(1) - 1.5, num2str(1), 'FontSize', 14)
text(ca.Children(end).XData(end) + .15, ca.Children(end).YData(end) + .15, 'd', 'FontSize', 14)
