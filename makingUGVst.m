% makingUGVst
% INPUTS
% nodeArray = this is an array of the nodes that are used to create the s
% and t values for UGV tour
% OUTPUTS
% sNew = the new s value that is pulled from nodeArray
% tNew = the new t value that is pulled from nodeArray matching s

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