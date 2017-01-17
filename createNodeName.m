% createNodeName
% creates node names for GTSP solver
% INPUTS
% v_Adj = matrix that gives all the nodes and costs
% OUTPUTS
% G = a graph that has the new node names ('V%d')

function [G] = createNodeName(v_Adj)

given_nodes = length(v_Adj);
node_Name = cell(1, given_nodes);

for i = 1:given_nodes
   node_Name{i}  = sprintf('V%d', i);
end

G = digraph(v_Adj, node_Name);

% figure;
% plot(G, 'EdgeLabel', G.Edges.Weight);
% title('Given Graph');

end