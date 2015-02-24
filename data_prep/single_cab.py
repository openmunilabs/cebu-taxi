# filters one day file into one cab data only
#f = open("cebu_data/locationupdate.csv","r") 
f = open("2013-10-04.csv","r") 

print('{"type": "cebu_taxi", "features": [');

lucky_id="";

counter=0
for line in f:
	if counter==0:
		counter=1
		continue

	els=line.split(";")

	if counter ==1:
		lucky_id=els[8]

	#print(els[8], els[9], els[10], els[1])

	if counter <100 and lucky_id==els[8]: 
		counter = counter+1
		print('{"type": "Point", "coordinates": ['+els[10]+', '+els[9]+']},')
	elif lucky_id==els[8]:
		counter = counter+1
		print('{"type": "Point", "coordinates": ['+els[10]+', '+els[9]+']}')
		break

print(']}');
