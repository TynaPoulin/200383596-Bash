#!/bin/bash
#COMP 2101 - Tyna Poulin
#Student ID - 200383596

#Assignment - Command Source Identification

#This program asks a user for command names, then tells the user which
#software package the command comes from.

#This part of the program runs if the user asks for help in the arguement.
#It prompts the user to enter the command, then exits.
case $1 in
  -h|--help)
    echo "Please enter a command name to learn which software package
    your command comes from"
    exit 0
esac

#This part of the program checks the user input against the database
#of available packages, and sends the output to a text file.  It then
#displays the contents of the text file to the screen.  I can't seem to
#get this part to work, but it does continue looping....like forever.
while [[ $1 != "" ]]; do
  dpkg -S ~/user/bin [$1] > request.txt
  cat request.txt | $1
  echo "Please enter a command name:"
  command
  #exit 1
#This part of the program tells the user that when they typed nothing
#that it is not a command name, then exits the program.  I can't seem
#to get to this part of the program.....likely because the prgram gets
#hung up on the loop that never ends.
  if [ $1 == "" ]; then
    echo "You did not enter a command name"
    exit 0
  fi
done
