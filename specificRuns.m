



i = 8;
j = 5;
k = 1;
filename = [num2str(i) '_' num2str(j) '_' num2str(k)];
[ansTime, problem] = test(i, j, filename);
time(6, :) = [double(i), double(j), double(k), ansTime, double(problem)];