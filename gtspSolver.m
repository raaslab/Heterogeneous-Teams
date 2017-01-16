% gtspSolver
% solves the gtsp and outputs what is needed
% INPUTS
% v_Cluster = matrix that shows the node to cluster relationship
% v_Adj = matrix that shows the node to node (edge) relationships and the
% costs
% OUTPUTS



function [] = gtspSolver(v_Cluster, v_Adj)


[G_init] = createNodeName(v_Adj);

% [alpha_noon] = createAlphaNoon(v_Adj)
% [beta_noon] = createBetaNoon(v_Adj)

[s, t] = findedge(G_init);

Adj_G_init = full(adjacency(G_init));
Adj_G_init_ind = sub2ind(size(Adj_G_init), s(:),t(:));
Adj_G_init(Adj_G_init_ind(:)) = G_init.Edges.Weight(:);

[atspAdjMatrix, infcost]  = gtsp_to_atsp(Adj_G_init, cell2mat(v_Cluster), alpha_noon, beta_noon, G_init);



end