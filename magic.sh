for f in $(ls); do cat $f | sort | uniq -c | sort -nr | sed -e "s/^/$f/" | awk '{ print $1 "," $3 "," $2  }' ; done
