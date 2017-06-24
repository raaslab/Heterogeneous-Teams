

function [] = createGTSPFile(filename, matrix)

fileID = fopen(filename,'w');

fprintf(fileID, 'NAME: TEST\n');
fprintf(fileID, 'TYPE: AGTSP\n');
fprintf(fileID, 'COMMENT: NA\n');
fprintf(fileID, 'DIMENSION:  201\n');
fprintf(fileID, 'GTSP_SETS: 21\n');
fprintf(fileID, 'EDGE_WEIGHT_TYPE: EXPLICIT\n');
fprintf(fileID, 'EDGE_WEIGHT_FORMAT: FULL_MATRIX\n');
fprintf(fileID, 'EDGE_WEIGHT_SECTION\n');
fprintf(fileID, '%d\n', matrix);
fprintf(fileID, 'GTSP_SET_SECTION:\n');
fprintf(fileID, '1 1 2 3 4 5 6 7 8 9 10 -1\n');
fprintf(fileID, '2 11 12 13 14 15 16 17 18 19 20 -1\n');
fprintf(fileID, '2 21 22 23 24 25 26 27 28 29 30 -1\n');
fprintf(fileID, '3 31 32 33 34 35 36 37 38 39 40 -1\n');
fprintf(fileID, '4 41 42 43 44 45 46 47 48 49 50 -1\n');
fprintf(fileID, '5 51 52 53 54 55 56 57 58 59 60 -1\n');
fprintf(fileID, '6 61 62 63 64 65 66 67 68 69 70 -1\n');
fprintf(fileID, '7 71 72 73 74 75 76 77 78 79 80 -1\n');
fprintf(fileID, '8 81 82 83 84 85 86 87 88 89 90 -1\n');
fprintf(fileID, '9 91 92 93 94 95 96 97 98 99 100 -1\n');
fprintf(fileID, '10 101 102 103 104 105 106 107 108 109 110 -1\n');
fprintf(fileID, '11 111 112 113 114 115 116 117 118 119 120 -1\n');
fprintf(fileID, '12 121 122 123 124 125 126 127 128 129 130 -1\n');
fprintf(fileID, '13 131 132 133 134 135 136 137 138 139 140 -1\n');
fprintf(fileID, '14 141 142 143 144 145 146 147 148 149 150 -1\n');
fprintf(fileID, '15 151 152 153 154 155 156 157 158 159 160 -1\n');
fprintf(fileID, '16 161 162 163 164 165 166 167 168 169 170 -1\n');
fprintf(fileID, '17 171 172 173 174 175 176 177 178 179 180 -1\n');
fprintf(fileID, '18 181 182 183 184 185 186 187 188 189 190 -1\n');
fprintf(fileID, '19 191 192 193 194 195 196 197 198 199 200 -1\n');
fprintf(fileID, '20 201 202 203 204 205 206 207 208 209 210 -1\n');
fprintf(fileID, '21 211 -1\n');

fprintf(fileID, 'EOF');

fclose(fileID);

end