module data;

import std.string;

class Data{
	public GeoPos[] points;

	void Append(double latitude, double longitude, double altitude) {
		points ~= GeoPos(latitude, longitude, altitude);
	}

	override string toString() const {
		return format("%(%s\n%)\n", points);
	}	
}

struct GeoPos {
	public double latitude = 0;
	public double longitude = 0;
	public double altitude = 0;

	this(double latitude, double longitude, double altitude) {
		this.latitude = latitude;
		this.longitude = longitude;
		this.altitude = altitude;
	}

	string toString() const {
		return format("%4.12f,%4.12f,%4.12f", longitude, latitude, altitude);
	}
}