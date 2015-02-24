# filters big file, and prints out only data for one day

f = open("cebu_data/locationupdate.csv","r") 

today="2013-10-04" #it's Friday!
nextweek="2013-10-11"

counter=0
for line in f:
	counter = counter+1
	if counter==1:
		continue

	els=line.split(";")

	if today==els[1].split(" ")[0]:
		print line.strip()
	if nextweek==els[1].split(" ")[0]:
		break

