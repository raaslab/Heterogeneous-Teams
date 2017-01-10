% makingUGVst
% INPUTS

% OUTPUTS

function [sNew, tNew] = makingUGVst(nodeArray)

num = numel(nodeArray);
sNew = [];
tNew = [];

for i = 1:num
    if i == num
        sNew(end+1) = nodeArray(i);
        tNew(end+1) = nodeArray(1);
    else
        sNew(end+1) = nodeArray(i);
        tNew(end+1) = nodeArray(i+1);
    end
end

end