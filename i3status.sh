#!/bin/sh
# shell script to prepend i3status with more stuff

cnt=0

i3status -c ~/.i3/.i3status.conf | while :
do
        read line
		if [[ $cnt -lt 2 ]]; then
	        echo $line || exit 1
		else
			layout=`xkblayout-state print "%s"`
			line=`echo $line | sed 's/]//'`
			echo "$line,{\"full_text\":\"$layout\",\"color\": \"#ffff00\"}" || exit 1
		fi
		((cnt++))
done
