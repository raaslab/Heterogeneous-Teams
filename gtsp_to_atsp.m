%##########################################################################
%
% Noon-Bean Transformation :
% Convert Generlized TSP to Asymmetric TSP
%
% Inputs: gtspAdjMatrix: Full GTSP Adjacency Matrix
%         setMap: node groupings in the same order as in gtspAdjMatrix
%          alpha_noon: we are replacing the cost from sum of all the edges to 
%                       sum of any tour
% 
% Outputs: atspAdjMatrix: Full transformed Adjacency Matrix for ATSP
%          infCost: Large numeric value assigned for infinite edge cost
%                   (This is used internally in the toolbox)
%
%##########################################################################

function [atspAdjMatrix infcost]  = gtsp_to_atsp(gtspAdjMatrix, setMap, alpha_noon, beta_noon,G_comp)


atspAdjMatrix = (gtspAdjMatrix*0) - 1; % marking edges
adjMatrixCostCalcs = gtspAdjMatrix*0;

% intra-cluster arcs
numSets = max(setMap);

for i=1:numSets
   
    % intra-cluster arcs
    
    indexes = find(setMap == i);
    
    if(length(indexes) > 1)
        
        for j = 1:length(indexes)-1
            atspAdjMatrix(indexes(j),indexes(j+1)) = 0;
        end

        % close the cluster loop
        atspAdjMatrix(indexes(end),indexes(1)) = 0;

    end
        %inter-cluster arc switching

        for j = 2:length(indexes)

            for k=1:length(setMap)

                if(setMap(indexes(j)) ~= setMap(k))

                    if(gtspAdjMatrix(indexes(j),k) ~= 0)

                        atspAdjMatrix(indexes(j-1),k) = gtspAdjMatrix(indexes(j),k);
                        adjMatrixCostCalcs(indexes(j-1),k) = gtspAdjMatrix(indexes(j),k);
                    end

                end

            end

        end


        for k=1:length(setMap)

            if(setMap(indexes(1)) ~= setMap(k))

                if(gtspAdjMatrix(indexes(1),k) ~= 0)

                    atspAdjMatrix(indexes(end),k) = gtspAdjMatrix(indexes(1),k);
                
                    adjMatrixCostCalcs(indexes(end),k) = gtspAdjMatrix(indexes(1),k);

                end

            end

        end
    
end



%totalcost = sum(sum(adjMatrixCostCalcs(adjMatrixCostCalcs>0)));
maxCost = max(max(adjMatrixCostCalcs));
beta = alpha_noon;%2*maxCost;%totalcost;%2*maxCost;


% should i add the edges from the starting vertex out here?


for i=1:length(setMap)
    
    for j=1:length(setMap)
        
        if(atspAdjMatrix(i,j) ~= 0 && atspAdjMatrix(i,j) ~= -1)
            
            atspAdjMatrix(i,j) = (atspAdjMatrix(i,j) + beta);%*1000 % random factor of 1000 added beware
            adjMatrixCostCalcs(i,j) = adjMatrixCostCalcs(i,j) + beta;
        end
    end
end

[X_t Y_s] = meshgrid(1:length( G_comp.Nodes.Name), 1:length( G_comp.Nodes.Name));
G_atsp = digraph(Y_s,X_t, atspAdjMatrix(:), G_comp.Nodes.Name,'OmitSelfLoops'); 

totalcost = sum(sum(adjMatrixCostCalcs));


beta2 = beta_noon; %2*totalcost;
[r(:,1) r(:,2)]=find(atspAdjMatrix==-1); % adjusting for -1 subtraction see below comments
testing = atspAdjMatrix;
for i=1:length(setMap)
    
    for j=1:length(setMap)
        
        if(atspAdjMatrix(i,j) ~= 0)
            if(isempty(find(r(:,1)==i&r(:,2)==j)))
                atspAdjMatrix(i,j) = atspAdjMatrix(i,j)+beta2;
            else
                atspAdjMatrix(i,j) = atspAdjMatrix(i,j)+beta2+1;
                
            % addition late finding -1 that are not on diagonal this is required
            % because the formulation ends up subtracting 1 from intranode intercluster
            % edges
            end
            
            testing(i,j) = testing(i,j)+beta2;
        end
    end
end





infcost = beta2;

end