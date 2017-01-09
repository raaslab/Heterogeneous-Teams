% makingUGVst
% INPUTS

% OUTPUTS

function [sNew, tNew] = makingUGVst(nodeArray)

num = numel(nodeArray);
sNew = [];
tNew = [];

for i = 1:num
    for j = 1:num
        if (nodeArray(i) ~= nodeArray(j))
            sNew(end+1) = nodeArray(i);
            tNew(end+1) = nodeArray(j);
        end
    end
    
end

end