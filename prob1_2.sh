

month=` date -d yesterday +%m`
year=` date -d yesterday +%Y`
day=` date -d yesterday +%d`

curl -s "https://www.wunderground.com/history/airport/GNV/$year/$month/$day/DailyHistory.heml?&format=1" > GNV_yesterday.txt

maxtemp=`cat GNV_yesterday.txt | sort -t ',' -k2nr | awk -F, 'FNR==1 {print($2)}'`
echo "Yesterday's maximum temperature is: $maxtemp F"
