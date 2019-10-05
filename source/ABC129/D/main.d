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

void main()
{
    readAll();
    const int n = nextInt();
    int[][1001] queue;
    int[] indecies;
    
    foreach (i;0..n){
        indecies ~= i;
        foreach (j;0..n-1){
            queue[i] ~= nextInt()-1;
        }
    }
    
    int counter = 0;
    while(true){
        counter++;
        bool[1001] skip;
        bool doneOnceFlag = false;
        
        for (int i = 0;i<indecies.length;i++){
            const int idx = indecies[i];
            if (queue[idx].length == 0){
                indecies = indecies[0..i] ~ indecies[i + 1..$];
                i--;
                continue ;
            }
            
            if (skip[idx]){
                continue ;
            }
            
            const int opponent = queue[idx][0];
            if (skip[opponent]){
                continue ;
            }
            
            if (queue[opponent][0] == idx){
                queue[idx] = queue[idx][1..$];
                queue[opponent] = queue[opponent][1..$];
                skip[idx] = true;
                skip[opponent] = true;
                doneOnceFlag = true;
            }
        }

        if (indecies.length == 0){
            (counter - 1).to!string.writeln;
            return ;
        }
        
        if (!doneOnceFlag){
            "-1".writeln();
            return ;
        }
    }
}
