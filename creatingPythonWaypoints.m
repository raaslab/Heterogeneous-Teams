

filename = ['zzzpythonWaypoints.txt'];
fileID = fopen(filename,'w');

count = 1;
for a = 1:numel(latlongele(:,1))
    fprintf(fileID, 'Waypoint(frame = 3, command = 16, is_current = 0, autocontinue = True, param1 = 5, x_lat = %f, y_long = %f, z_alt = 10),', latlongele(a,1),latlongele(a, 2));
%     count = count+1;
%     fprintf(fileID, '', latlongele(count));
%     count = count+1;
    fprintf(fileID, '\n');
end


fclose(fileID);
