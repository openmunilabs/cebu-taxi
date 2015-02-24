#f = open("cebu_data/locationupdate.csv","r") 
f = open("2013-10-04.csv","r") 

unique={}

counter=0

for line in f:
	if counter==0:
		counter=1
		continue

	els=line.split(";")

	if not els[8] in unique.keys():
		unique[els[8]]=1
	else:
		unique[els[8]]=unique[els[8]]+1

	#print els

	counter = counter+1

print unique
print len(unique)
