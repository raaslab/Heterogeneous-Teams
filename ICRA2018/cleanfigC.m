open C.fig
axis equal;
xlim([-75,125])

ca = gca;

ca.Children.LineWidth = 2;
ca.Children.ArrowSize = 10;
ca.Children.MarkerSize = 6;

ca.Children.NodeLabel = '';
for i = 5 : 5 : length(ca.Children.XData)
    text(ca.Children(end).XData(i) + 1.5, ca.Children(end).YData(i) - 1.5, num2str(i), 'FontSize', 14)
end
text(ca.Children(end).XData(1) + 1.5, ca.Children(end).YData(1) - 1.5, num2str(1), 'FontSize', 14)
% text(ca.Children(end).XData(end) + 1.5, ca.Children(end).YData(end) - 1.5, num2str(length(ca.Children(end).YData)), 'FontSize', 14)
