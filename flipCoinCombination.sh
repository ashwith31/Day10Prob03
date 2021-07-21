#! /bin/bash -x
declare -A Singlet
declare -A Doublet
declare -A Triplet
declare -A Percentage
declare -a P
p=0
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
Percentage[$key]=$p1
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
Percentage[$key]=$p1
echo "Percentage of $key win is $p1%"
done
echo " "
echo "**************Triplet***********"
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0
for((i=0;i<$a;i++))
do
flip1=$(( RANDOM%2 ))
flip2=$(( RANDOM%2 ))
flip3=$(( RANDOM%2 ))
if [ $flip1 -eq 0 -a $flip2 -eq 0 -a $flip3 -eq 0 ]
then
(( hhh++ ))
elif [ $flip1 -eq 0 -a $flip2 -eq 0 -a $flip3 -eq 1 ]
then
(( hht++ ))
elif [ $flip1 -eq 0 -a $flip2 -eq 1 -a $flip3 -eq 0 ]
then
(( hth++ ))
elif [ $flip1 -eq 0 -a $flip2 -eq 1 -a $flip3 -eq 1 ]
then
(( htt++ ))
elif [ $flip1 -eq 1 -a $flip2 -eq 0 -a $flip3 -eq 0 ]
then
(( thh++ ))
elif [ $flip1 -eq 1 -a $flip2 -eq 0 -a $flip3 -eq 1 ]
then
(( tht++ ))
elif [ $flip1 -eq 1 -a $flip2 -eq 1 -a $flip3 -eq 0 ]
then
(( tth++ ))
else
(( ttt++ ))
fi
done
Triplet['HHH']=$hhh
Triplet['HHT']=$hht
Triplet['HTH']=$hth
Triplet['HTT']=$htt
Triplet['THH']=$thh
Triplet['THT']=$tht
Triplet['TTH']=$tth
Triplet['TTT']=$ttt
for key in ${!Triplet[*]}
do
p1=$( echo ${Triplet[$key]}  $a | awk '{ print $1/$2*100 }' )
Percentage[$key]=$p1
echo "Percentage of $key win is $p1%"
done
echo " "
echo "After Sorting all the combinations with percentages:"
for key in ${!Percentage[*]}
do
P[((p++))]=${Percentage[$key]}
done
m=0
for ((i=0;i<$p;i++))
do
g=$((p-1))
for ((j=1;j<=$g;j++))
do
if [ ${P[j-1]} -gt ${P[j]} ]
then
	m=${P[j]}
	P[((j))]=${P[j-1]}
	P[((j-1))]=$m
fi
done
done
s=${P[-1]}
for key in ${!Percentage[*]}
do
if [ ${Percentage[$key]} -eq $s ]
then
echo "$key has won with maximum percentage of $s%"
fi
done
