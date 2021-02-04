

if md5sum -c md5sums.txt > /dev/null
then 
 echo firmware verified 1>&2
else
 echo firmware corrupt 1>&2
 exit 1
fi

cut -c 35- md5sums.txt | xargs stat -L --printf "%s %n\n" | awk '{ sub(/vl805_fw_/,"FW",$2); sub(/.bin/,"",$2); printf "0:%X %s\n", $1-1, $2 }'

