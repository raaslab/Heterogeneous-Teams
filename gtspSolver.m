% gtspSolver
% solves the gtsp and outputs what is needed
% INPUTS
% v_Cluster = matrix that shows the node to cluster relationship
% v_Adj = matrix that shows the node to node (edge) relationships and the
% costs
% OUTPUTS



function [] = gtspSolver(v_Cluster, v_Adj, numPoints)


[G_init] = createNodeName(v_Adj);

[alpha_noon] = createAlphaNoon(v_Adj, numPoints);
[beta_noon] = createBetaNoon(alpha_noon);

[s, t] = findedge(G_init);

Adj_G_init = full(adjacency(G_init));
Adj_G_init_ind = sub2ind(size(Adj_G_init), s(:),t(:));
Adj_G_init(Adj_G_init_ind(:)) = G_init.Edges.Weight(:);

[atspAdjMatrix, ~]  = gtsp_to_atsp(Adj_G_init, cell2mat(v_Cluster), alpha_noon, beta_noon, G_init);

[X_t, Y_s] = meshgrid(1:length(G_init.Nodes.Name), 1:length(G_init.Nodes.Name));
G_atsp = digraph(Y_s,X_t, atspAdjMatrix(:), G_init.Nodes.Name,'OmitSelfLoops');  % the command below omits zero cost edges that is why it's done like this

G_atsp2_tsp = graph([], []);

str_1node_intra = cellfun(@(x,y) sprintf('1;%s', x), G_atsp.Nodes.Name,'uni', 0);
str_2node_intra = cellfun(@(x,y) sprintf('2;%s', x), G_atsp.Nodes.Name,'uni', 0);
str_3node_intra = cellfun(@(x,y) sprintf('3;%s', x), G_atsp.Nodes.Name,'uni', 0);

G_atsp2_tsp = addedge(G_atsp2_tsp, [str_1node_intra;str_2node_intra], [str_2node_intra;str_3node_intra], zeros(2*G_atsp.numnodes,1));

str_1node = cellfun(@(x,y) sprintf('1;%s', x), G_atsp.Edges.EndNodes(:,1),'uni', 0);
str_3node = cellfun(@(x,y) sprintf('3;%s', x), G_atsp.Edges.EndNodes(:,2),'uni', 0);

G_atsp2_tsp = addedge(G_atsp2_tsp, str_1node,str_3node,G_atsp.Edges.Weight(:)); %
nodes_totsp = G_atsp2_tsp.numnodes;
edges_totsp = G_atsp2_tsp.numedges;
%-------------------------------------------------------------------------%
[Out_sol, time_concorde_struct] = TSP_tour_Dat(G_atsp2_tsp,'/home/klyu/softwares/concorde/concorde/TSP/concorde');          % need to make sure this is the right path
%-------------------------------------------------------------------------%
Out_solName = G_atsp2_tsp.Nodes.Name(Out_sol);

Out_solName = Out_solName(cell2mat(cellfun(@(x) ismember('1',x(1)) , Out_solName,'uni',0)));
cnter = 1;
for i =1:length(Out_solName)
    split_Out{cnter}= Out_solName{i}(3:end);
    cnter  = cnter+1;
end

%%
% cycle so that first and last clusters are same

cyclic = 1; % assumed not cyclic no split
cur_cycle_checked = 1;

while (cyclic == 1)
    
    % repeat_check = find(~cellfun(@isempty,strfind(temp_fin_sol, temp_fin_sol{1}))); %test if there is a repeat
    conc_nod_first = strtok(strtok(split_Out{1}, '-'),'V');  %connected nod first
    conc_nod_last = strtok(strtok(split_Out{end}, '-'),'V');  % connected last last
    
    conc_clus_first = strsplit(split_Out{1}, '-');  %connected cluster first
    conc_clus_last = strsplit(split_Out{end}, '-');  % connected cluster last
    if((isequal(conc_clus_first{2},conc_clus_last{2}))|| (isequal(conc_nod_first,conc_nod_last)))
        if ((cur_cycle_checked > length(split_Out)) && (isequal(conc_nod_first,conc_nod_last)) && (~isequal(conc_clus_first{2},conc_clus_last{2})))
            cyclic = 0;  % if first and last node are same and we have cycled more than once
        else
            split_Out = circshift(split_Out,1,2);%cycle me
            cyclic = 1;
        end
    else
        cyclic = 0; % it is cyclic already
    end
    cur_cycle_checked = cur_cycle_checked+1;
    
end

%%
% split_Out{cnter} = split_Out{1};
%seq_clus = [1,3,5,2,4,4,6,6];
%seq_forw = true(1,length(seq_clus));
node_num_forw = [];
test_prev_forw = 'o';
cnter = 1;
% checking forward set for solution as we can have solution in both
% direction of split_Out
for i = 1:length(split_Out) % random initialisation
    if(isequal(test_prev_forw, split_Out{i}(regexp(split_Out{i},'-','start'):end)))
        %seq_forw(i) = false;
    else
        node_num_forw(cnter) =  str2num(split_Out{i}(2:(regexp(split_Out{i},'-','start')-1)));
        cnter = cnter + 1;
    end
    
    test_prev_forw = split_Out{i}(regexp(split_Out{i},'-','start'):end);
    
end
% checking for backward set
cnter = 1;
node_num_back = [];
test_prev_back = 't'; % random initialisation
for i = length(split_Out):-1:1
    if(isequal(test_prev_back,split_Out{i}(regexp(split_Out{i},'-','start'):end)))
        %seq_forw(i) = false;
    else
        node_num_back(cnter) = str2num( split_Out{i}(2:(regexp(split_Out{i},'-','start')-1)));
        cnter = cnter + 1;
    end
    
    test_prev_back = split_Out{i}(regexp(split_Out{i},'-','start'):end);
    
end

s_forw(1:(length(node_num_forw)-1)) = node_num_forw(1:(end-1));
t_forw(1:(length(node_num_forw)-1)) = node_num_forw(2:end);
s_forw(length(node_num_forw)) = node_num_forw(end);
t_forw(length(node_num_forw)) = node_num_forw(1);

G_comp_allnode = digraph(V_comp, node_name);

edges_forw = findedge(G_comp_allnode, s_forw,t_forw);
forw_cost = sum(G_comp_allnode.Edges.Weight(edges_forw(edges_forw~=0)));

s_back(1:(length(node_num_back)-1)) = node_num_back(1:(end-1));
t_back(1:(length(node_num_back)-1)) = node_num_back(2:end);
s_back(length(node_num_back)) = node_num_back(end);
t_back(length(node_num_back)) = node_num_back(1);

edges_back = findedge(G_comp_allnode, s_back,t_back);
back_cost = sum(G_comp_allnode.Edges.Weight(edges_back(edges_back~=0)));

split_Out_back = flip(split_Out);

if(forw_cost<=back_cost)
    outfin_sol = node_num_forw;
    outfin_cost = forw_cost;
else
    outfin_sol = node_num_back;
    outfin_cost = back_cost;
end


end