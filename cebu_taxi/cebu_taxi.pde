import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

import de.fhpotsdam.unfolding.marker.Marker;

import de.fhpotsdam.unfolding.marker.MarkerManager;
import de.fhpotsdam.unfolding.marker.SimpleLinesMarker;
import de.fhpotsdam.unfolding.marker.SimplePointMarker;
import de.fhpotsdam.unfolding.utils.MapUtils;

UnfoldingMap map;

Location startLoc = new Location(10.3018f, 123.9018f);

Location loc = new Location(10.3018f, 123.9018f);


//MarkerManager<Marker> markerManager;

Table table;

int num = 46;

int max = 0;

void setup() {
    frameRate(30);
    size(800, 450);
    map = new UnfoldingMap(this);
    MapUtils.createDefaultEventDispatcher(this, map);
    map.zoomAndPanTo(startLoc, 12);

    table = loadTable("data.csv");

    max = table.getRowCount();
}

int i = 0;
int j = 0;

boolean drawing = false;


void draw() {
    map.draw();

    if (drawing) {
        if (j < 3) {
            //delay(6000);
            delay(1);
            j = j + 1;
        } else if (i >= max) {
            drawing = false;
        } else {


            TableRow row = table.getRow(i);
            i = i + 1;

            String timestamp = row.getString(0);

            String time = timestamp.substring(10, 16);

            String date = "";

            int hour = int(time.substring(1, 3));
            int min = int(time.substring(4, 6));

            if (hour + 8 > 23) {
                date = "October 5, 2013";
            } else {
                date = "October 4, 2013";
            }

            hour = hour + 8;

            String shour = "";
            String smin = "";

            if (hour < 13) {
                shour = str(hour);
                smin = str(min);
                if (hour < 10) {
                    shour = "0" + shour;
                }
                if (min < 10) {
                    smin = "0" + smin;
                }
                time = shour + ":" + smin + " am";
            } else if (hour < 24) {
                hour = hour - 12;
                shour = str(hour);
                smin = str(min);
                if (hour < 10) {
                    shour = "0" + shour;
                }
                if (min < 10) {
                    smin = "0" + smin;
                }
                time = shour + ":" + smin + " pm";
            } else {
                hour = hour - 24;
                shour = str(hour);
                smin = str(min);
                if (hour < 10) {
                    shour = "0" + shour;
                }
                if (min < 10) {
                    smin = "0" + smin;
                }
                time = shour + ":" + smin + " am";
            }


            fill(0, 102, 153);
            textSize(32);
            text(date, 500, 420);
            text(time, 605, 380);

            fill(#FFA812);

            for (int i = 0; i < num; i++) {
                float lon = row.getFloat(i * 2 + 2);
                float lat = row.getFloat(i * 2 + 1);


                if (lat > 0 && lon > 0) {

                    loc = new Location(lon, lat);
                    ScreenPosition pos = map.getScreenPosition(loc);

                    ellipse(pos.x, pos.y, 10, 10);
                }
            }

        }
    }
    else
    {
            fill(64 , 64, 64);
            textSize(52);
            text("Cebu City, Philippines", 125, 200);
            textSize(32);
            text("24 hours timelapse", 255, 250);      
    }
}

void keyPressed() {
    drawing = !drawing;
}
  
