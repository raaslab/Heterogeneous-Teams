% gtspSolver
% solves the gtsp and outputs what is needed
% INPUTS
% v_Cluster = matrix that shows the node to cluster relationship
% v_Adj = matrix that shows the node to node (edge) relationships and the
% costs
% OUTPUTS


function [outfin_sol, outfin_cost, Out_solName, Out_sol, G_init, edges_totsp, nodes_totsp, time_concorde_struct] = gtspSolver(v_Cluster, v_Adj, numPoints, xOut, yOut)


[G_init] = createNodeName(v_Adj);

[alpha_noon] = createAlphaNoon(v_Adj, numPoints);
[beta_noon] = createBetaNoon(alpha_noon, numPoints);

[s, t] = findedge(G_init);

Adj_G_init = full(adjacency(G_init));
Adj_G_init_ind = sub2ind(size(Adj_G_init), s(:),t(:));
Adj_G_init(Adj_G_init_ind(:)) = G_init.Edges.Weight(:);

[atspAdjMatrix, ~]  = gtsp_to_atsp(Adj_G_init, cell2mat(v_Cluster), alpha_noon, beta_noon, G_init);

% [X_t, Y_s] = meshgrid(1:length(G_init.Nodes.Name), 1:length(G_init.Nodes.Name));
[~, atspAdjMatrix] = createBaseStation(v_Cluster, atspAdjMatrix, alpha_noon, beta_noon);                                  % creates the base station for v_Adj and v_Cluster
[row, column, ~] = find(atspAdjMatrix>-1);
G_atsp = digraph;
[G_atsp] = createEdgesGTSP(G_atsp, row, column, atspAdjMatrix, xOut, yOut);
%-------------------------------------------------------------------------%

% ADD BASE STATION
% ADD ONE NODE WITH EDGES TO EVERY POINT (COST==ALPHA+BETA) AND FROM EVERY
% POINT (COST==0)

%-------------------------------------------------------------------------%
G_atsp2_tsp = graph([], []);

str_1node_intra = cellfun(@(x,y) sprintf('1;%s', x), G_atsp.Nodes.Name,'uni', 0);
str_2node_intra = cellfun(@(x,y) sprintf('2;%s', x), G_atsp.Nodes.Name,'uni', 0);
str_3node_intra = cellfun(@(x,y) sprintf('3;%s', x), G_atsp.Nodes.Name,'uni', 0);
G_atsp2_tsp = addedge(G_atsp2_tsp, [str_1node_intra;str_2node_intra], [str_2node_intra;str_3node_intra], zeros(2*G_atsp.numnodes,1));

str_1node = cellfun(@(x,y) sprintf('1;%s', x), G_atsp.Edges.EndNodes(:,1),'uni', 0);
str_3node = cellfun(@(x,y) sprintf('3;%s', x), G_atsp.Edges.EndNodes(:,2),'uni', 0);
G_atsp2_tsp = addedge(G_atsp2_tsp, str_1node,str_3node,G_atsp.Edges.Weight(:));

nodes_totsp = G_atsp2_tsp.numnodes;
edges_totsp = G_atsp2_tsp.numedges;

[Out_sol, ~] = TSP_tour_Dat(G_atsp2_tsp,'/home/klyu/software/concorde/concorde/TSP/concorde');

Out_solName = G_atsp2_tsp.Nodes.Name(Out_sol);
Out_solName = Out_solName(cell2mat(cellfun(@(x) ismember('1',x(1)) , Out_solName,'uni',0)));






end