#!/bin/sh
#mkdir -p porto

mkdir -p custom/tmp/css;
cp ./index.html custom/tmp/index.html.bak;
cp css/custom.scss custom/tmp/css/custom.scss.bak;
cp -R master/sass/custom/ custom/tmp/sass;
cp ../porto/HTML/*.html .;
cp -R ../porto/HTML/video .;
cp -R ../porto/HTML/vendor .;
cp -R ../porto/HTML/js .;
cp -R ../porto/HTML/img .;
cp -R ../porto/HTML/master .;
cp custom/tmp/index.html.bak ./index.html;
cp -R custom/tmp/sass/ master/sass/custom;

newdir="css"
mkdir -p $newdir
for i in master/sass/*.scss;
do
	filename=$(basename "$i")
	echo This file is $newdir/$filename;
	echo '---\n---' | cat - $i > /tmp/temp-$filename && mv /tmp/temp-$filename $newdir/$filename;
	rm $i;
done

cp custom/tmp/css/custom.scss.bak $newdir/custom.scss;

# Can't remember what I was using this for
#echo "\n@import \"variables_overrides\";" >> master/sass/config/_imports.scss;
