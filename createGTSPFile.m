

function [] = createGTSPFile(filename, matrix)

fileID = fopen(filename,'w');

fprintf(fileID, 'NAME: TEST\n');
fprintf(fileID, 'TYPE: AGTSP\n');
fprintf(fileID, 'COMMENT: NA\n');
fprintf(fileID, 'DIMENSION:  41\n');
fprintf(fileID, 'GTSP_SETS: 11\n');
fprintf(fileID, 'EDGE_WEIGHT_TYPE: EXPLICIT\n');
fprintf(fileID, 'EDGE_WEIGHT_FORMAT: FULL_MATRIX\n');
fprintf(fileID, 'EDGE_WEIGHT_SECTION\n');
fprintf(fileID, '%d\n', matrix);
fprintf(fileID, 'GTSP_SET_SECTION:\n');
fprintf(fileID, '1 1 2 3 4 -1\n');
fprintf(fileID, '2 5 6 7 8 -1\n');
fprintf(fileID, '3 9 10 11 12 -1\n');
fprintf(fileID, '4 13 14 15 16 -1\n');
fprintf(fileID, '5 17 18 19 20 -1\n');
fprintf(fileID, '6 21 22 23 24 -1\n');
fprintf(fileID, '7 25 26 27 28 -1\n');
fprintf(fileID, '8 29 30 31 32 -1\n');
fprintf(fileID, '9 33 34 35 36 -1\n');
fprintf(fileID, '10 37 38 39 40 -1\n');
fprintf(fileID, '11 41 -1\n');
fprintf(fileID, 'EOF');

fclose(fileID);

end