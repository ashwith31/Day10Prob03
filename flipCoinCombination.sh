#! /bin/bash -x

flip=$(( RANDOM%2 ))
if [ $flip -eq 0 ]
then
echo "Its heads"
else
echo "Its tails"
fi
