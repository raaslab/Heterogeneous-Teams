

<<<<<<< HEAD
origin = [37.1977494, -80.5801930, 530];
=======
origin = [37.1979045, -80.5800240, 530];
>>>>>>> 96812cd35965143f68278b7827f373289eea5e4f
latitude(1:numPointsInit) = [0];
longitude(1:numPointsInit) = [0];
elevation(1:numPointsInit) = [0];

for i = 1:numPointsInit
    [latitude(i), longitude(i), elevation(i)] = enu2geodetic(x1(i), y1(i), 0, origin(1), origin(2), origin(3), wgs84Ellipsoid);
end

latlongele = [latitude', longitude', elevation'];