

origin = [37.196749, -80.580270, 530];
latitude(1:numPointsInit) = [0];
longitude(1:numPointsInit) = [0];
elevation(1:numPointsInit) = [0];

for i = 1:numPointsInit
    [latitude(i), longitude(i), elevation(i)] = enu2geodetic(GLNSx(i), GLNSy(i), 0, origin(1), origin(2), origin(3), wgs84Ellipsoid);
end

latlongele = [latitude', longitude', elevation'];