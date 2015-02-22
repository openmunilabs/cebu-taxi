import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;  

import de.fhpotsdam.unfolding.marker.Marker;

import de.fhpotsdam.unfolding.marker.MarkerManager;
import de.fhpotsdam.unfolding.marker.SimpleLinesMarker;
import de.fhpotsdam.unfolding.marker.SimplePointMarker;
import de.fhpotsdam.unfolding.utils.MapUtils;

UnfoldingMap map;

Location startLocation = new Location(10.3018f, 123.9018f);

Location locationBerlin = new Location(10.3018f, 123.9018f);


//MarkerManager<Marker> markerManager;

float a = 10.3018f;
float b = 123.9018f;

Table table;

void setup() {
    size(800, 600);
    map = new UnfoldingMap(this);
    MapUtils.createDefaultEventDispatcher(this, map);
    map.zoomAndPanTo(startLocation, 12);
    
    table = loadTable("2013-10-04.csv", "header");
}

int i=0;

void draw() {
    map.draw();
    
  
  //for (TableRow row : table.rows()) {
    
    TableRow row = table.getRow(i);
    i=i+1;
    
    String timestamp = row.getString("adjustedtimestamp");
    
    fill(0, 102, 153);
    textSize(32);
    text(timestamp, 10, 30); 
    
    fill(#FFA812);
    
    float lat = row.getFloat("lat");
    float lon = row.getFloat("lon");
    //int id = row.getString("id");
    //String species = row.getString("species");
    //String name = row.getString("name");
    
    //println(name + " (" + species + ") has an ID of " + id);
    
   Location locationBerlin = new Location(lat, lon);
   ScreenPosition posBerlin = map.getScreenPosition(locationBerlin);
  
  ellipse(posBerlin.x, posBerlin.y, 10, 10);  
   //a=a+0.0001f;
   //b=b+0.0001f;    
  //}
  

}