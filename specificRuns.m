% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 28;
j = 4;
k = 1;
location =  89;
% filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
filename = ['testCase'];
[ansTime, problem] = test(i, j, filename);
% time(location, :) = [double(i), double(j), double(k), ansTime, double(problem)];
time = [double(i), double(j), double(k), ansTime, double(problem)];