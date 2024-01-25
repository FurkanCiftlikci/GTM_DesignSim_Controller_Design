C:

cd C:\Program Files\FlightGear 2020.3

SET FG_ROOT=C:\Program Files\FlightGear 2020.3\data

START .\\bin\fgfs.exe --fdm=null --native-fdm=socket,in,30,localhost,5502,udp   --prop:/sim/rendering/shaders/quality-level=0 --aircraft=777-300 --fog-fastest --disable-clouds --start-date-lat=2004:06:01:09:00:00 --disable-sound --in-air --airport=BIKF --runway=19 --altitude=500 --heading=0 --offset-distance=0 --offset-azimuth=0  
