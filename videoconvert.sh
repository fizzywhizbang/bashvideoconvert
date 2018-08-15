#!/bin/bash
for f in *
do
filename=$(basename -- "$f")
extension="${filename##*.}"
filename="${filename%.*}"
if [ $extension == "mkv" ]
then
echo $filename
ffmpeg -i "$f" -c copy -map 0 "$filename.mp4"
fi

if [ $extension == "mkv" ]
then
echo $filename
ffmpeg -i "$f" -c:v libx264 -c:a copy -bsf:a aac_adtstoasc "$filename.mp4"
fi

done
