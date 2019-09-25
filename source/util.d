import std.stdio;
import std.conv;
import std.string;
import std.format;
import std.algorithm;

string[] array;
int index;

void readAll()
{
    string lines;
    while (!stdin.eof) {
        lines ~= stdin.readln();
    }

    array = lines.split();
}

int nextInt(){
    return array[index++].to!int;
}

long nextLong(){
    return array[index++].to!long;
}

string next(){
    return array[index++];
}
