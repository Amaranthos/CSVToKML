import std.stdio;
import std.csv;
import std.conv;
import std.string;
import std.math;

import data;
import fileIO;

void main() {

	string fileText = std.file.readText("data.csv");
	fileText = fileText.removechars(" ");

	FileOut write = new FileOut("out.kml");
	write.InitFile();

	foreach(dataPoint; csvReader!(string[string])(fileText, null)) {
		Data data = new Data();

		data.Append(to!double(dataPoint["Latitude"]), to!double(dataPoint["Longitude"]), 10);

		for(float i = 0.0; i <= 1.0; i += 0.1) {
			data.Append(to!double(dataPoint["Latitude"]) - 0.0005 * i * 2 * PI, to!double(dataPoint["Longitude"]) + 0.0005, 100 + to!double(dataPoint["Hsig"]) * sin((i * 2 * PI) * 1/(to!double(dataPoint["Tz"]))) * 10);
		}

		for(float i = 1.0; i >= 0.0; i -= 0.1) {
			data.Append(to!double(dataPoint["Latitude"]) - 0.0005 * i * 2 * PI, to!double(dataPoint["Longitude"]) - 0.0005, 100 + to!double(dataPoint["Hsig"]) * sin((i * 2 * PI) * 1/(to!double(dataPoint["Tz"]))) * 10);
		}

		data.Append(to!double(dataPoint["Latitude"]), to!double(dataPoint["Longitude"]), 10);

		write.Write(dataPoint, data);
	}

	write.FinaliseFile();
}