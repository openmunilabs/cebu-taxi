# calculates number of location points per day

f = open("../../cebu_data/cebu_data/locationupdate.csv","r") 

today=""
counter=0
for line in f:
	counter = counter+1
	if counter==1:
		continue

	els=line.split(";")

	if today!=els[1].split(" ")[0]:
		print today, " - ", counter, " points"
		today=els[1].split(" ")[0]
		counter=0
	#print(els[8], els[9], els[10], els[1])

