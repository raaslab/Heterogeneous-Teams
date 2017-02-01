% plotsForPaper
% this creates all plots needed for one run. You need to load a .mat first
% contained within ./answers/

figure();
plot(G3, 'XData', x4, 'YData', y4, 'EdgeLabel', G3.Edges.Weight)        % creates the final UAV tour
title('Final UAV tour')
xlabel('x Position')
ylabel('y Position')

figure();
plot(G4, 'XData', x5, 'YData', y5)
title('Final UGV tour')
xlabel('x Position')
ylabel('y Position')