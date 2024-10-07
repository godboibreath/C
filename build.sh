#!/bin/bash
dir=build
file="$1"
output=app.out
output_file="$dir/$output"
cpp=cpp
c=c
command="$file -o $output_file"
result=0

function rimraf {
    if [ -d "$dir" ]
        then
            rm -r $dir
    fi
    mkdir $dir
}

if [ -f "$file" ]
    then
        ext=${file##*.}
        if [ "$ext" = "$cpp" ]
            then
                rimraf
                `g++ $command`
                result=1
            elif [ "$ext" = "$c" ]
                then
                    rimraf
                    `gcc $command`
                    result=1
                else
                    echo "File $file extenstion does not include in [$c, $cpp]"
                fi
    else
        echo "File $file does not exist"
fi

if [ "$2" != "" ]
    then 
        if [ "$2" = "-s" ]
            then
                $output_file
        fi
fi