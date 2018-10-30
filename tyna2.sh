#!/bin/bash
#COMP 2101 - Tyna Poulin
#Student ID - 200383596

#Assignment - Memory Usage Report

#This program will create a report on memory usage using the free command.

#This section pulls the memory report and saves it in a text file
#called Memory.txt.
echo " "
echo "Welcome to your memory usage report!"
echo " "
free -m > memory.txt
cat memory.txt
echo " "

#This section pulls the data from the second line only in the text file and
#prints the requested column.
echo "Total amount of free RAM in the system (in MB):"
cat memory.txt | head -2 | tail -1 | awk '{print $4}'
echo " "

#This section pulls the data from the second line only in the text file
#and adds the used and cached ram values together.
echo "The Sum of the used and cached RAM (in MB):"
cat memory.txt | head -2 | tail -1 | awk '{print $3+$6}'
echo " "

#This section pulls the data from the second line only in the text file and
#subtracts the free ram from the available ram.
echo "The difference between the available RAM and free RAM (in MB):"
cat memory.txt | head -2 | tail -1 | awk '{print $7-$4}'
echo " "

#This section pulls the data from the second line only in the text file
#and calculates the percentage of the total ram that is being used.
echo "How much RAM is used as a percentage of the total RAM (in MB):"
cat memory.txt | head -2 | tail -1 | awk '{print $3/$2*100}'
echo " "

#This section pulls the data from the second line only in the text file
#and calculates the percentage of the total ram that is used for cache.
echo "How much RAM is used for cache as a percentage of the total RAM (in MB):"
cat memory.txt | head -2 | tail -1 | awk '{print $6/$2*100}'
echo " "
