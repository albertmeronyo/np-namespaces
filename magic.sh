for f in $(ls); do cat $f | sort | uniq -c | sort -nr | sed -e "s/^/$f /g" | awk '{ print $1 "," $3 "," $2  }' ; done


for f in $(ls *.txt.gz); do zcat $f | sort | uniq -c | sort -nr | sed -e "s/^/$f /g" | awk '{ print $1 "," $3 "," $2  }' > $f.stats.csv; total=10803231; cat $f.stats.csv | cut -d, -f3 | sed -e "s/$/\/$total/g" | bc -l > $f.rel.csv; paste $f.stats.csv $f.rel.csv --delimiter="," > $f.stats.rel.csv ; done
