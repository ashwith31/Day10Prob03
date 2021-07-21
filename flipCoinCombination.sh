#! /bin/bash -x
declare -A Singlet
declare -A Doublet
declare -A Triplet
read -p "Enter the number of times you want to flip the coin:" a
echo "H==Head"
echo "T==Tail"
echo "**********Singlet*********"
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
p1=$( echo ${Singlet[$key]}  $a | awk '{ print $1/$2*100 }' )
echo "Percentage of $key win is $p1%"
done
echo " "
echo "***********Doublet************"
hh=0
ht=0
th=0
tt=0
for((i=0;i<$a;i++))
do
flip1=$(( RANDOM%2 ))
flip2=$(( RANDOM%2 ))
if [ $flip1 -eq 0 -a $flip2 -eq 0 ]
then
(( hh++ ))
elif [ $flip1 -eq 0 -a $flip2 -eq 1 ]
then
(( ht++ ))
elif [ $flip1 -eq 1 -a $flip2 -eq 0 ]
then
(( th++ ))
else
(( tt++ ))
fi
done
Doublet['HH']=$hh
Doublet['HT']=$ht
Doublet['TH']=$th
Doublet['TT']=$tt
for key in ${!Doublet[*]}
do
p1=$( echo ${Doublet[$key]}  $a | awk '{ print $1/$2*100 }' )
echo "Percentage of $key win is $p1%"
done
