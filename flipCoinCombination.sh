#! /bin/bash -x
declare -A Singlet
read -p "Enter the number of times you want to flip the coin:" a
echo "H==Head"
echo "T==Tail"
h=0
t=0
for((i=0;i<$a;i++))
do
flip=$(( RANDOM%2 ))
if [ $flip -eq 0 ]
then
(( h++ ))
else
(( t++ ))
fi
done
Singlet['H']=$h
Singlet['T']=$t
for key in ${!Singlet[*]}
do
p=$( echo ${Singlet[$key]}  $a | awk '{ print $1/$2*100 }' )
echo "Percentage of $key win is $p%"
done

