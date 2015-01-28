#!/bin/sh
#mkdir -p porto

cp ./index.html custom/index.html.bak;
cp -R master/sass/custom/ custom/sass;
cp ../porto/HTML/*.html .;
cp -R ../porto/HTML/video .;
cp -R ../porto/HTML/vendor .;
cp -R ../porto/HTML/js .;
cp -R ../porto/HTML/img .;
cp -R ../porto/HTML/master .;
cp custom/index.html.bak ./index.html;
cp -R custom/sass/ master/sass/custom;

newdir="css"
mkdir -p $newdir
for i in master/sass/*.scss;
do
	filename=$(basename "$i")
	echo This file is $newdir/$filename;
	echo '---\n---' | cat - $i > /tmp/temp-$filename && mv /tmp/temp-$filename $newdir/$filename;
	rm $i;
done

# Can't remember what I was using this for
#echo "\n@import \"variables_overrides\";" >> master/sass/config/_imports.scss;
