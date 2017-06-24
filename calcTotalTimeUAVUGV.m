

sumTimes = 0;
ans3 = find(finalMatrix==1);

for i = 1:numel(ans3)
    ans4 = roundedGtspMatrix(ans3(i));
    sumTimes = sumTimes + ans4;
    
end


