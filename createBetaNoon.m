% createBetaNoon
% creates Beta_noon for GTSP solver
% INPUTS
% alpha = the alpha that will be used to calculate beta
% numPoints = allows for correct calculation of beta
% OUTPUTS
% beta = use for creation of TSP

function [beta] = createBetaNoon(alpha, numPoints)

beta = (alpha * numPoints) + alpha;

end