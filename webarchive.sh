#!/bin/bash

cat reports.csv | while read line; do
        date="$(echo "${line}" | sed 's/^"//g;s/"$//g' |  awk -F'","' '{print $1}')"
        author="$(echo "${line}" | sed 's/^"//g;s/"$//g' |  awk -F'","' '{print $2}')"
        name="$(echo "${line}" | sed 's/^"//g;s/"$//g' |  awk -F'","' '{print $3}')"
        filetype="$(echo "${line}" | sed 's/^"//g;s/"$//g' |  awk -F'","' '{print $4}')"
        url="$(echo "${line}" | sed 's/^"//g;s/"$//g' |  awk -F'","' '{print $5}')"
        filename="${date}-${author}-${name}"                                     

	echo " [+] Archiving via web.archive.org/save/"
	curl "https://web.archive.org/save/${url}" | head
	sleep 3
done
