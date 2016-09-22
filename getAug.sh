#script to get the weather from WeatherUnderground for August between 1973 and 2016

#Script by Matt 

month=08 # Only looking at August.
mkdir data #Make a directory to put the data

for year in {1973..2016} #For each year between 1943 and 2016
do

  mkdir data/$year #Make a directory for that year's data

  for day in {1..31} #For each day in the month (Always using August, so 31 is OK here, need to modify is not August)
  do
    if [ $day -lt 10 ]	#Add a "0" to the front of single digit days
    then
     day=0$day
    fi 
  
    echo "Getting data for $year $month $day"
   
    Date=$year$month$day #Make a string to use in naming the files.
    #Download the weather data for GNV, redirecting to the year folder and using $Date for name with date in YYYMMDD format.
    curl -s "https://www.wunderground.com/history/airport/GNV/$year/$month/$day/DailyHistory.heml?&format=1" > data/$year/GNV_$Date.txt
  done
done

