#!/bin/sh
#mkdir -p porto

mkdir -p custom/tmp/css;
cp ./index.html custom/tmp/index.html.bak;
cp css/custom.scss custom/tmp/css/custom.scss.bak;
cp -R master/sass/custom/ custom/tmp/sass;
cp ../porto/theme/HTML/*.html .;
cp -R ../porto/theme/HTML/video .;
cp -R ../porto/theme/HTML/vendor .;
cp -R ../porto/theme/HTML/js .;
cp -R ../porto/theme/HTML/img .;
cp -R ../porto/theme/HTML/master .;
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


# These can be run to strip the standard headers and footers
# Still requires manual addition of front matter and removing an extra </div> at the end for now

# Strip footers first
# matches=$( ack -m 1 -o "<footer" --type=html --ignore-dir=_includes --ignore-dir=_layouts|cut -d: -f1,2 ); while read -r match; do file=$( echo $match | cut -d: -f1 ) ; line=$( echo $match | cut -d: -f2 ) ; sed -i -e "${line},\$d" $file; done <<< "$matches"

# Then strip headers
# matches=$( ack -m 1 -o "<div role=\"main\" class=\"main\">" --type=html --ignore-dir=_includes --ignore-dir=_layouts|cut -d: -f1,2 ); while read -r match; do file=$( echo $match | cut -d: -f1 ) ; line=$( echo $match | cut -d: -f2 ) ; sed -i -e "1,${line}d" $file; done <<< "$matches"