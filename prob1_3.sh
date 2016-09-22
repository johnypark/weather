
## Code to get daily maximum from each year from 1973 to 2016, and store the txt files at direcotry: MaxbyYear 

cd data # cd into data directory 
mkdir MaxbyYear
origin=`pwd` #Set origin directory 
for year in {1973..2016}
    do 
	echo "opening $year directory .."
	cd $year 
		for filename in *.txt

			do
			cat $filename | sort -t ',' -k2nr | awk -F, 'FNR==1 {print($2)}' >> $origin/MaxbyYear/dailymax_`pwd|tail -c 5`.txt
			echo "processing $filename... making dailymax_`pwd|tail -c 5`.txt to :$origin/MaxbyYear/... "
		 done
		 
		  
	sort dailymax_`pwd|tail -c 5`.txt | tail -n 1 >> $origin/yeartemp.txt
	echo $year >> $origin/year.txt 
    	cd $origin  ##Go back to: $origin directory...
done
paste year.txt yeartemp.txt>> yearlymaxtemp.txt ##output is the list of yearly max temp


echo "Five years with hottest temperatures" >> prob1_3_output.txt
sort -k 2 -n yearlymaxtemp.txt | tail -n 5 >> prob1_3_output.txt
echo "Five years with lowest temperatures" >> prob1_3_output.txt
sort -k 2 -n yearlymaxtemp.txt | head -n 5 >> prob1_3_output.txt



