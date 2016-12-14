function [x_reshape, G_final,fval,exitflag,output] = call_gtsp_recursive_func(V_Cluster, V_adj)
    
   
    
    %%
    
    ind_empty_clus = cellfun(@isempty, V_Cluster); % we want to remove the unnecessary nodes 
    for i = 1:length(V_adj)
               
        node_name{i} = sprintf('%d',i);
    
    end

    if issymmetric(V_adj)
        G_orig = graph(V_adj,node_name);
    else
        G_orig = digraph(V_adj,node_name);
    end
    
%     figure;
%     plot(G_orig, 'EdgeLabel', G_orig.Edges.Weight);

    
    rm_intra = [];
        
    V_comp = distances(G_orig, 1:length(V_adj),1:length(V_adj));
    V_comp_upper = triu(V_comp); % keeping the upper triangular matrix

    % figure;
    G_comp = graph(V_comp_upper, node_name,'upper');
    G_comp.Nodes.Cluster = V_Cluster;
%     plot(G_comp, 'EdgeLabel', G_comp.Edges.Weight);
    
    
    G_comp_tm = rmnode(G_comp, find(ind_empty_clus)); % removing redundant nodes % removed if they don't have cluster relationships
    store_name = G_comp_tm.Nodes(:,'Name'); % will restore names later this is just to extract the right V_comp via ind_remain_edges
    G_comp_tm.Nodes(:,'Name') = [];
    
    
    V_Cluster  = G_comp_tm.Nodes.Cluster; % Cluster relationship changed
    
    V_comp_new = zeros(length(V_comp_upper)-length(find(ind_empty_clus))); % as we have removed reduntant nodes
    ind_remain_edges = sub2ind(size(V_comp_new),G_comp_tm.Edges.EndNodes(:,1), G_comp_tm.Edges.EndNodes(:,2));
    V_comp_new(ind_remain_edges) = G_comp_tm.Edges.Weight(:);
    V_comp_upper = V_comp_new;
    %ff= sub2ind(size(V_c),G_orig.Edges.EndNodes(:,1), G_orig.Edges.EndNodes(:,2))
    %V_c(ff) = G_orig.Edges.Weight(:)
    
    
    
    %%
    
 
    %cluster to node mapping ** currently all nodes belong to some clusters
    Cluster_to_node = arrayfun(@(i)find(cellfun(@(s)ismember(i,s), V_Cluster)), 1:max([V_Cluster{:}]) , 'UniformOutput', false); % reverse lookup for Cluster_cell %http://stackoverflow.com/questions/14934796/reverse-lookup-in-matlab-cell-array-of-indices
    %%

    %remove edges whose nodes have same parent clusters...[i]subset or =[j] (parent clusters of i subset or equal=parent cluster of j)
    %psuedo go to every cluster find all the intra cluster edges and remove
    %edges from V_comp which have relation as shown above
    %OR-- go to every edge in V_comp(upper) and check for abover relationship(THE 'OR' STATEMENT IS CODED RIGHT NOW)

    for i = 1:(length(V_comp_upper)-1)

        for j = 2:length(V_comp_upper)

            if (length(V_Cluster{i})>=length(V_Cluster{j})) % so that we can check for subset it's difficult to check if you don't know which one is bigger
                if(all(ismember(V_Cluster{j}, V_Cluster{i}))) %if j's parent cluster is subset or equal to i's parent cluster then remove the edge alltogether
                    V_comp_upper(i,j) =  0;
                end
            elseif(length(V_Cluster{i})<length(V_Cluster{j}))
                if(all(ismember(V_Cluster{i}, V_Cluster{j})))
                    V_comp_upper(i,j) =  0;
                end
            end

        end


    end

    node_sel = zeros(1,length(V_comp_upper));

    f = [V_comp_upper(:);node_sel(:)]; % column wise % explore only useful variables - subs = triu(ones(8))-eye(8)

    node_sel_ind = (length(V_comp_upper)^2+1):(length(V_comp_upper)^2+length(V_comp_upper)); % incorporating the node variables too..needed for {if node visited should also exit and subtour elimination}

    intcon = [find(V_comp_upper);node_sel_ind']; %**** doubt is that should we list the other variables or not -> another idea is to use this indexing and just select these variables in the Aeq and A and Beq and B

    %%

% ******these conditions do not work properly because of a case when we% don't need to exit a cluster for the whole tour so number of edges exit and enter remains zero for that cluster.
%     % this for loop is to find a part of A matrix -> this goes from cluster to
%     % cluster looking for incoming and outgoing edges and then stores them as a
%     % 1r64c(1 row 64col)  then we will put that total number of such edges >=2
%     % there is a removal of edges in this also; which is different from above as
%     % this removes all intracluster edges regardless of parent cluster
%     % relationship..
%     A_clus_ineq = (sparse(length(Cluster_to_node),(length(V_comp_upper)^2 + length(V_comp_upper))));
%     [X,Y] = meshgrid(1:length(V_comp_upper),1:length(V_comp_upper));
%     for i = 1:length(Cluster_to_node)
%         V_comp_clus = V_comp_upper;
%         if(length(Cluster_to_node{i}) > 1)
%             rm_intra = nchoosek(Cluster_to_node{i}, 2);
%             ind_rm_intra = sub2ind(size(V_comp_upper), rm_intra(:,1),rm_intra(:,2));
%             V_comp_clus(ind_rm_intra) = 0; % 
%         end
%         X_clusmask = ismember(X, Cluster_to_node{i});
%         Y_clusmask = ismember(Y, Cluster_to_node{i});
%         adj_V_eq_clus = [V_comp_clus~=0].*(X_clusmask|Y_clusmask);
%         A_clus_ineq(i,:) = -1*horzcat(adj_V_eq_clus(:)', node_sel); % just attaching node variables with edge variables... node_variables are zero in these but included for uniformity required to push to intlinprog
% 
%     end
% 
%     B_clus_ineq = -1*2*ones(length(Cluster_to_node),1); % atleast case then this will also become inequality >=2 (check if this is true by considering for 3 4 5 how it behaves - * might not be required to check)


%%
% adding constraint to visit atlease one node in each cluster

     A_clus_ineq = (sparse(length(Cluster_to_node),(length(V_comp_upper)^2 + length(V_comp_upper))));
     for i = 1:length(Cluster_to_node)
         A_clus_ineq(i,(length(V_comp_upper)^2+1):end) = -1*ismember(1:length(V_comp_upper),Cluster_to_node{i});
     end
     B_clus_ineq = -1*ones(length(Cluster_to_node),1);
    %%

    %ensuring that if node visited should also exit...node visit continuity 
    adj_V_comp_upper = sparse([V_comp_upper~=0]); % storing the indexes of active edges
    %repmat(adj_V_comp_upper(:)',length(V_comp_upper),1);

    interedge_4node = zeros(length(V_comp_upper),length(V_comp_upper)^2);
    [X,Y] = meshgrid(1:length(V_comp_upper),1:length(V_comp_upper));

    for i = 1:length(V_comp_upper)
        X_clusmask = ismember(X, i);
        Y_clusmask = ismember(Y, i);
        curnode_interedge = adj_V_comp_upper.*(X_clusmask|Y_clusmask);
        interedge_4node(i,:) = curnode_interedge(:)';

    end

    Aeq_continuity = horzcat(interedge_4node, -2*eye(length(V_comp_upper))); % attaching the node variables
    Beq_continuity = zeros(length(V_comp_upper),1);

    Aeq = Aeq_continuity; 
    Beq = Beq_continuity;

    %%
    
    lb = zeros(length(V_comp_upper)^2+length(V_comp_upper), 1);
    ub = [double(adj_V_comp_upper(:)); ones(length(V_comp_upper),1)];
    
    options = optimoptions('intlinprog','Display','off');
    problem = struct('f',f,'intcon',intcon,...
        'Aineq',A_clus_ineq,'bineq',B_clus_ineq,'Aeq',Aeq,'beq',Beq,...
        'lb',lb,'ub',ub,'options',options,...
        'solver','intlinprog');

    [x,fval,exitflag,output]  = intlinprog(problem);
    
    
    tours = detectSubtours(x(1:length(V_comp_upper)^2), [Y(:) X(:)]);
    numtours = length(tours); % number of subtours
    fprintf('# of subtours: %d\n',numtours);
    
    %%
    A = A_clus_ineq; % Allocate a sparse linear inequality constraint matrix
    B = B_clus_ineq;
    adj_V_comp_A = sparse(length(adj_V_comp_upper), length(adj_V_comp_upper));
    mask_edge_comb = sparse(length(adj_V_comp_upper), length(adj_V_comp_upper));
    
    counter = size(A_clus_ineq,1) + 1;
    
    while numtours > 1 % repeat until there is just one subtour
        B = [B;zeros(numtours,1)]; % allocate b
        A = [A;spalloc(numtours,length(A_clus_ineq),length(intcon))]; % a guess at how many nonzeros to allocate
        for ii = 1:numtours
             subTourIdx = tours{ii}; % Extract the current subtour
    %         The next lines find all of the variables associated with the
    %         particular subtour, then add an inequality constraint to prohibit
    %         that subtour and all subtours that use those stops.
            edge_comb = nchoosek(sort(subTourIdx(:)),2); %edges out of selected nodes each row of nodes_comb can be used to make edges [3 nodes make 3 edges (3C2)]
            ind_edge_comb = sub2ind(size(V_comp_upper),edge_comb(:,1), edge_comb(:,2));
            mask_edge_comb(ind_edge_comb) = 1;
            adj_V_comp_A = adj_V_comp_upper.*(mask_edge_comb);
            node_notin_subset = find(~ismember(1:length(V_comp_upper), unique(edge_comb)));
            B = [B;zeros((length(node_notin_subset)-1),1)]; % allocate b again as we have condition for each node not in subset
            A = [A;spalloc((length(node_notin_subset)-1),length(A_clus_ineq),length(intcon))]; % a guess at how many nonzeros to allocate % allocate a again as we have condition for each node not in subset
            for l = 1:length(node_notin_subset)
                node_notsol = sparse(1,length(V_comp_upper)); % nodes not in solution
                node_notsol(node_notin_subset(l)) = 1;
                A(counter,:) = [adj_V_comp_A(:)' node_notsol];
                B(counter,:) = length(tours{ii});                        
                counter = counter + 1;
                
            end
            mask_edge_comb = zeros(length(V_comp_upper));        
                
          
          
        end
        options = optimoptions('intlinprog','Display','off');
        problem = struct('f',f,'intcon',intcon,...
        'Aineq',A,'bineq',B,'Aeq',Aeq,'beq',Beq,...
        'lb',lb,'ub',ub,'options',options,...
        'solver','intlinprog');

        % Try to optimize again
        [x,fval,exitflag,output]  = intlinprog(problem);

       

        % How many subtours this time?
        tours = detectSubtours(x(1:length(V_comp_upper)^2), [Y(:) X(:)]);
        numtours = length(tours); % number of subtours
        fprintf('# of subtours: %d\n',numtours);
    end
    %%
    %

   

    x_reshape = reshape(x, length(V_comp_upper), []);

    %% 
    figure(6); 
    G_final = graph(x_reshape(:,1:(end-1)).*V_comp_upper, store_name,'upper');
    G_final.Nodes.Cluster = V_Cluster;
    plot(G_final, 'EdgeLabel', G_final.Edges.Weight);


    

end


