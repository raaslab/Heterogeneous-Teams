function [O, time_concorde_struct] = TSP_tour_Dat(G_gadget2,path_1) % 'graph' - shoudld be a complete graph if incomplete  edges which u don't want should  have cost more than sum of the weights
                                                    % 'path' - '/home/ashishkb/softwares/concorde/concorde_build/TSP/concorde' like this 
                                                    
                                                    

% Computes a Traveling Salesman Tour of a set of points.
%
%
% 	T: points in X ordered according to the TSP tour
% 	O: order of indices in X such that X(O(i),:) is the i'th point in the tour.
%	len: length of the final tour

% Must contain at least three points
node_s = G_gadget2.numnodes;
edge_s = G_gadget2.numedges;
if node_s < 3
	error('Must contain at least three points');
	return;
end

% Check if the rows and columns need to be swapped

% Concorde rounds the distances to integers
% So if points have distances less than 0.5 units, they will become 0
% To avoid this, I am going to scale all the distances
% Right now, I am just going to scale by 100
% TODO a better way of scaling, do this only if necessary


% Open the temporary tsplib format file
c = clock;
in_filename = sprintf('%stemp.tsp', num2str(1000000*c(6),9));
out_filename = sprintf('%stemp.sol', num2str(1000000*c(6),9));
fid = fopen(in_filename,'W');
if fid < 0
	error('Cannot create temp file');
	return;
end


% Write the header data to the file

% fprintf(fid, ['NAME : temp\n' ...
% 							'TYPE : TSP\n' ...
% 							'COMMENT : temp\n' ...
% 							'DIMENSION : ' num2str(n) '\n' ...
% 							'EDGE_WEIGHT_TYPE : EXPLICIT\n' ...
%                             'EDGE_WEIGHT_FORMAT :  FULL_MATRIX\n' ...
%                             'NODE_COORD_TYPE :  NO_COORDS\n' ...
%                             'EDGE_WEIGHT_SECTION : \n']);

% Write out the coordinates
[s_gadget2 t_gadget2] = findedge(G_gadget2);
s_gadget2 = s_gadget2 - 1;
t_gadget2 = t_gadget2 - 1;
weights_mat = round(G_gadget2.Edges.Weight(:));%-26000000)*100); %[156967]%15030730
%weights_mat = weights_mat-32900;
weights_mat(weights_mat<0)=0;
G_gadget2_edges = [s_gadget2(:) t_gadget2(:) weights_mat(:)];

fprintf(fid, [num2str(node_s) ' ' num2str(edge_s) '\n']);


fprintf(fid,'%d %d %d\n',G_gadget2_edges(:,1:3).');

fclose(fid);



% Call the concorde solver
cmd = [path_1 ' -x' ' -N 10 ' in_filename];

time_concorde_struct = struct('total_time',{},'concorde_time',{});
time_concorde_struct(1).concorde_time  = tic;

system(cmd);
 time_concorde_struct(1).concorde_time = toc(time_concorde_struct(1).concorde_time);
% Read in results
fid = fopen(out_filename,'r');
if fid < 0
	error('Cannot open output file.');
	return;
end

[O] = fscanf(fid,'%d');
O = O(2:end) + 1; 		% concorde starts indices at 0 instead of 1
end
% T = X(O,:);
% 
% len = 0;
% for i = 1 : n-1
% 	len = len + norm(T(i,:)-T(i+1,:));
% end
% len = len + norm(T(end,:)-T(1,:));

