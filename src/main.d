import std.stdio;
import std.file;
import std.csv;
import std.string;
import std.range;

void main() {
	auto file = File("data.csv");
	auto range = file.byLine();

	foreach(line; range) {
		writeln(line);
	}
}