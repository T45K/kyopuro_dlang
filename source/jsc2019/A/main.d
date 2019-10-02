import std.stdio;
import std.conv;
import std.string;
import std.format;
import std.algorithm;
import std.typecons;

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

void main(){
    readAll();
    const int n = nextInt();
    const int m = nextInt();
    
    int[] a = new int[n];
    int[] b = new int[m];
    
    foreach (i; 0..n)
    {
        a[i] = nextInt();
    }
    
    foreach (i; 0..m){
        b[i] = nextInt();
    }
    
    alias  Pair = Tuple!(int,int);
    Pair[] weight = new Pair[2_000_000];
    bool[] checked = new bool[2_000_000];
    
    for (int i = 0;i<n;i++){
        for (int j = 0;j<m;j++){
            int c = a[i]+b[j];
            if (checked[c] == false){
                checked[c] = true;
                weight[c] = Pair( i,j);
            }else {
                const int d = (weight[c])[0];
                const int e = (weight[c])[1];
                writeln( i.to!string ~ " " ~ j.to!string ~ " " ~ d.to!string ~ " " ~ e.to!string);
                return ;
            }
        }
    }
    
    "-1".writeln();
}
