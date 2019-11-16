#!/bin/bash

Rootdir="."

AUTHOR="Ninad"
HEADER="${Rootdir}/includes/head.html"
BEFORE="${Rootdir}/includes/before-body.html"
AFTER="${Rootdir}/includes/after-body.html"
TEMPL="${Rootdir}/includes/my_template.html"

for mf in $Rootdir/*.md
do
	filename="${mf%.*}"
	echo "Converting $mf to $filename.html" #Pandoc command for conversion to html:		
	pandoc \
		-H "$HEADER" \
		-B "$BEFORE" \
		-A "$AFTER" \
		-V author-meta="$AUTHOR" \
		-s --template "$TEMPL" \
		-f markdown -t html5 $mf -o $filename.html		
done

# Can even use a custom template with:
# --template default_mod.html 
# -s stands for standalone
# --css mycssfile.css (css linking already done in HEADER) 