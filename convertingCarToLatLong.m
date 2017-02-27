

origin = [37.196878, -80.578293, 530];
latitude(1:numPointsInit) = [];
longitude(1:numPointsInit) = [];
elevation(1:numPointsInit) = [];

for i = 1:numPointsInit
    [latitude(i), longitude(i), elevation(i)] = enu2geodetic(x1(i), y1(i), 0, origin(1), origin(2), origin(3), wgs84Ellipsoid);
end