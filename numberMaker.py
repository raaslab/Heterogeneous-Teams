#!/usr/bin/env python
# creating a .plan for qgroundcontrol


vertices = 100
counter = 1
batteryLevels = 7
#repr(vertex)
#repr(counter)

filename = 'test.txt'
file = open(filename,"w")

for a in range(1,vertices+1):

	file.write(repr(a)+' ')	
	for b in range(1,batteryLevels+1):
		file.write(repr(counter)+' ')
		counter = counter+1
	file.write("-1\n")

file.write(repr(vertices+1) + ' ' + repr(counter) + ' -1\n')
file.write('EOF')

file.close()




#file.write("\"polygon\":[\n")
