import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;  

UnfoldingMap map;

Location startLocation = new Location(10.3018f, 123.9018f);

Location locationBerlin = new Location(10.3018f, 123.9018f);

float a = 10.3018f;
float b = 123.9018f;

void setup() {
    size(800, 600);
    map = new UnfoldingMap(this);
    MapUtils.createDefaultEventDispatcher(this, map);
    map.zoomAndPanTo(startLocation, 13);
}

void draw() {
    map.draw();
    
    fill(#FFA812);
  
   Location locationBerlin = new Location(a, b);
   ScreenPosition posBerlin = map.getScreenPosition(locationBerlin);
  
  ellipse(posBerlin.x, posBerlin.y, 10, 10);  
   a=a+0.0001f;
   b=b+0.0001f;
}
