#making data for processing script (first two hours test run)
# one line per second of the day (in order)
# first column is datetime, rest are (lat, long) x number of cabs


import datetime

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

cabs={}
lookup=[]

for index, cab in enumerate(unique):
	print index, cab
	cabs[cab]=index
	lookup.append(cab)


print cabs
print lookup

print len(cabs)
print len(lookup)

#exit();

#cabs has list of all cabs and their numbers/ids

f.close()

raw={}

f = open("2013-10-04.csv","r") 

counter=0
for line in f:
	if counter==0:
		counter=1
		continue

	els=line.split(";")
	stamp=els[1]
	cab=els[8]
	lat=els[9]
	lon=els[10]

	print counter
	print line

	if not stamp in raw.keys():
		raw[stamp]={}

	raw[stamp][cab]={"lat":lat,"lon":lon}

	#print els

	counter = counter+1
	if counter>20000:
		break
f.close()


#print raw


fo= open("data.csv","w") 

now = datetime.datetime(2013,10,4,0,0,0)

olddata=",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"

for i in range(60*60*24):
	data=""
	#print now
	now += datetime.timedelta(seconds=1)
	ts = ""+now.isoformat()+""
	ts=ts.replace("T"," ")
	#print ">>>", ts

	if ts in raw.keys():
		data=ts
		for j in range(len(lookup)):
			#print "cab: ",lookup[i]
			#print raw[ts].keys()
			if lookup[j] in raw[ts].keys():
				#print "match"
				data=data+","+raw[ts][lookup[j]]["lon"]+","+raw[ts][lookup[j]]["lat"]
			else:
				data=data+",0,0"
	else:
		data = ts
		for j in range(len(lookup)):
			data=data+",0,0"


	if i>60*60*2:
		break


	old=olddata.split(",")
	new=data.split(",")
	print("old ",len(old))
	print("new ",len(new))

	for k in range(len(new)):
		#print("k ",k)
		if k>0 and (new[k]=="0" or new[k]==""):
			#print("override")
			#print(new[k])
			#print(old[k])
			new[k]=old[k]

	data=",".join(new)

	olddata=data

	#print(">>", data);
	#print(ts);
	#print(ts[-2:]);
	if ts[-2:]=="00":
		fo.write(data+"\n")

fo.close()
#data=