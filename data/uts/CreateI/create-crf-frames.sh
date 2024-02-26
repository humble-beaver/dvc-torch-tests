#!/bin/bash
rm -rf images
rm -rf out

echo "qp $1 resolution $2 x $3"

for input in ../videos_crop/*.yuv; do

    echo "orginal"

    echo "-------------------"

    echo "$input"

    mkdir images

    mkdir images/H265L$1

    mkdir out

    OUT_FOLDER="out/H265L$1"

    mkdir -p $OUT_FOLDER

    FFREPORT=file=ffreport.log:level=56
    ffmpeg -pix_fmt yuv420p -s $2x$3 -i $input -c:v libx265 -preset veryfast -tune zerolatency -x265-params "qp=$1:keyint=10:verbose=1:csv-log-level=1:csv=report.txt" $OUT_FOLDER/out.mkv
    ffmpeg -i $OUT_FOLDER/out.mkv -f image2 images/H265L$1/im%04d.png
    echo "-------------------"

done
