% Convert from lat/lon to ft to meter(Calibrated at Smithfield)
%% Run for once
sim_lon(1:30000) = [];
sim_lat(1:30000) = [];
sim_alt(1:30000) = [];

%%

dist_lon = sim_lon - sim_lon(1);
dist_lat = sim_lat - sim_lat(1);

dist_lat= dist_lat * 180/pi * 364100.79 * 0.3048;
dist_lon= dist_lon * 180/pi * 291925.24 * 0.3048;

% Convert the altitude,ft to meter
alt= sim_alt * 0.3048;

figure;
plot3(dist_lon,dist_lat,alt,"black","LineWidth",2,"Marker",".")
title("Longitude - Latitude - Altitude");
xlabel("Longitude(m)");
ylabel("Latitude(m)");
zlabel("Altitude(m)");
grid on
