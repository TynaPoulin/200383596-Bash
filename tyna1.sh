#!/bin/bash
#COMP 2101 - Tyna Poulin
#Student ID - 200383596

#Assignment - Add command line arguments to a script

#This script will roll virtual dice, show what numbers were rolled and add
#the sum of all of the dice.



function diceroll () {                      #Beginning of diceroll program

sum=0                                       #These are the variables
count=${count:=2}                           #Default is 2 unless changed
sides=${sides:=6}                           #Default is 6 unless changed


while [ $count -gt 0 ]; do                  #This is the loop that rolls
  roll=$(( $RANDOM % $sides +1 ))           #the dice.
  sum=$(( $sum + $roll ))                   #The number on the die is added
  echo "Your die rolled $roll"              #to the sum and displayed on screen.
  count=$((count - 1))                      #The loop then continues until it
done                                        #reaches zero, then stops looping.
echo "You rolled a total of $sum"           #The sum of all of the dice is
                                            #displayed on screen before the
exit 0                                      #program ends.
}

echo "Type -h or --help for additional command line options"

#Displays command line options if user types -h or --help for arguement
while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
          echo "Command line options:"
          echo "-c N or --count N should set the count of dice to roll to N,
          N must be a number from 1 to 9"
          echo "-s N or --sides N should set the number of sides per die to N,
          N must be a number from 4 to 20"
          exit 0
          ;;
  esac

  #If -c argument is used with a number, this part checks the number to
  #ensure that it is between the parameters of 1-9.  If the number is outside
  #of the parameters, it will prompt the user to enter a number within
  #parameters then display an error message breaking the script.  If the
  #number is within parameters, it will assign the number to the variable.
  case $1 in
    -c|--count) shift
    if [[ $1 -lt 1 ]];then
      echo "Please enter a number between 1-9"
/dev/stderr
      exit 1
    elif [[ $1 -gt 9 ]]; then
      echo "Please enter a number between 1-9"
/dev/stderr
      exit 1
    fi
    count=$1
    ;;
  esac

  #If -s argument is used with a number, this part checks the number to
  #ensure that it is between the parameters of 4-20.  If the number is outside
  #of the parameters, it will prompt the user to enter a number within
  #parameters then display an error message breaking the script.  If the
  #number is within parameters, it will assign the number to the variable.
  case $2 in
    -s|--sides) shift
    if [[ $2 -lt 4 ]]; then
      echo "Please enter a number between 4-20"
/dev/stderr
    exit 1
  elif [[ $2 -gt 20 ]]; then
      echo "Please enter a number between 4-20"
/dev/stderr
    exit 1
  fi
    sides=$2
    ;;
  esac

  shift

  #This will begin the diceroll function in the program.
  diceroll
done
