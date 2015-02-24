#print top 100 records from file into GeoJSON
f = open("cebu_data/locationupdate.csv","r") 

print('{"type": "cebu_taxi", "features": [');

counter=0
for line in f:
	counter = counter+1
	if counter==1:
		continue

	els=line.split(";")

	#print(els[8], els[9], els[10], els[1])

	if counter <100: 
		print('{"type": "Point", "coordinates": ['+els[10]+', '+els[9]+']},')
	else:
		print('{"type": "Point", "coordinates": ['+els[10]+', '+els[9]+']}')
		break

print(']}');
