
type = [0, 0, 0];
for i = 2:12
    type(end+1, :) = [v_Type(finalTour(i), finalTour(i+1)), finalTour(i), finalTour(i+1)];
end
type