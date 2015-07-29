module fileIO;

import std.string;
import std.file;

import data;

class FileOut {

	private string path;

	this(string path) {
		this.path = path;


	}

	void InitFile() {
		write(path, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		append(path, "<kml xmlns=\"http://www.opengis.net/kml/2.2\">\n");
		append(path, "<Document>\n");

		append(path, "<name>Wave Data</name>\n");
		append(path, "<description>Wave Data pulled from https://data.qld.gov.au/, visualised as sine surfaces caluculated from the data set.</description>\n");
	}

	void Write(T)(T data, Data text) {
		append(path, "<Placemark>\n");

		append(path, "<name>" ~ data["Site"] ~ "</name>\n");
		
		append(path, "<Polygon>\n");

		append(path, "<extrude>0</extrude>\n");
		append(path, "<altitudeMode>relativeToGround</altitudeMode>\n");
		append(path, "<outerBoundaryIs>\n");
		append(path, "<LinearRing>\n");

		append(path, "<coordinates>\n");

		append(path, text.toString);

		append(path, "</coordinates>\n");
		append(path, "</LinearRing>\n");
		append(path, "</outerBoundaryIs>\n");
		append(path, "</Polygon>\n");
		append(path, "</Placemark>\n");
	}

	void FinaliseFile() {
		append(path, "</Document>\n");
		append(path, "</kml>");
	}
}