module data;



class Data{
	GeoPos[] points;
}

class GeoPos {
	double latitude = 0;
	double longitude = 0;
	double altitude = 0;

	GeoPos(double latitude, double longitude, double altitude) {
		this.latitude = latitude;
		this.longitude = longitude;
		this.altitude = altitude;
	}
}