% specificRuns
% this will run a specific case for if there's an error within "time"
% variable



i = 17;
j = 5;
k = 5;
location = 87;
filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
[ansTime, problem] = test(i, j, filename);
time(location, :) = [double(i), double(j), double(k), ansTime, double(problem)];