#!/bin/bash

fname=$1
#OSCAD_HOME=/home/fahimk/Oscad_Work/installed_OSCAD/OSCAD
#echo $OSCAD_HOME



#Removing unwanted content from output of xml file reading
sed -e "1d" -e "s/None//g" -e "s/\S*\(connector\)\S*//g" -e "s/Wire/RWire/g" $fname>temp0_sample.txt

##Making file proper without unwanted space
while read line
do 
echo $line
done <temp0_sample.txt>temp1_sample.txt

#Making proper netlist from above file
while read line
do
 echo $line|awk '{printf "%s ",$1}
	{	
	     if ($2~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$2; 
	else if ($2~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$2;
	else if ($2~/pin[0-9][0-9][X]/) printf "0 ",$2;
        else if ($2~/pin[0-9][0-9][Y]/) printf "%.3sY ",$2;
        else if ($2~/pin[0-9][0-9][W]/) printf "0 ",$2;
        else if ($2~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$2;
	else if ($2~/pin[0-9][A-E]/) printf "%.4sA ",$2;
	else if ($2~/pin[0-9][F-J]/) printf "%.4sF ",$2;
	else if ($2~/pin[0-9][X]/) printf "0 ",$2;
	else if ($2~/pin[0-9][Y]/) printf "%.3sY ",$2;
	else if ($2~/pin[0-9][W]/) printf "0 ",$2;
	else if ($2~/pin[0-9][Z]/) printf "%.3sZ ",$2;
	
	else if ($2=="") printf "\n",$2;
	else printf "error "
	}
	{	
	     if ($3~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$3; 
	else if ($3~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$3;
	else if ($3~/pin[0-9][0-9][X]/) printf "0 ",$3;
        else if ($3~/pin[0-9][0-9][Y]/) printf "%.3sY ",$3;
        else if ($3~/pin[0-9][0-9][W]/) printf "0 ",$3;
        else if ($3~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$3;
	else if ($3~/pin[0-9][A-E]/) printf "%.4sA ",$3;
	else if ($3~/pin[0-9][F-J]/) printf "%.4sF ",$3;
	else if ($3~/pin[0-9][X]/) printf "0 ",$3;
        else if ($3~/pin[0-9][Y]/) printf "%.3sY ",$3;
        else if ($3~/pin[0-9][W]/) printf "0 ",$3;
        else if ($3~/pin[0-9][Z]/) printf "%.3sZ ",$3;
	else if ($3=="") printf "\n",$3;
	else printf "error\n"
	}
	{       
             if ($4~/pin[0-9][0-9][A-E]/) printf "%.5sA\n",$4; 
        else if ($4~/pin[0-9][0-9][F-J]/) printf "%.5sF\n",$4;
	else if ($4~/pin[0-9][0-9][X]/) printf "0\n",$4;
        else if ($4~/pin[0-9][0-9][Y]/) printf "%.3sY\n",$4;
        else if ($4~/pin[0-9][0-9][W]/) printf "0\n",$4;
        else if ($4~/pin[0-9][0-9][Z]/) printf "%.3sZ\n",$4;
        else if ($4~/pin[0-9][A-E]/) printf "%.4sA\n",$4;
        else if ($4~/pin[0-9][F-J]/) printf "%.4sF\n",$4;
        else if ($4~/pin[0-9][X]/) printf "0\n",$4;
        else if ($4~/pin[0-9][Y]/) printf "%.3sY\n",$4;
        else if ($4~/pin[0-9][W]/) printf "0\n",$4;
        else if ($4~/pin[0-9][Z]/) printf "%.3sZ\n",$4;
        else if ($4=="") printf "\n",$4;
        else printf "error\n"
        }'
	
done<temp1_sample.txt>temp2_sample.txt

##Removing blank line
sed -i '/^$/d' temp2_sample.txt

####Taking backup for .cir file

cp $fname xml_extract.txt

echo "After cp of xml extract"
echo $fname

: <<'comment'

##.cir file for kicad
echo "****Netlist generated from fritzing****">$fname
echo "Adding component value in netlist"
for value in $(awk '{print $1}' temp2_sample.txt)
do 
line=`grep -w $value temp2_sample.txt`
echo $line
case ${value} in 
	R*|r*)	echo  "Enter value of resistance $value"
	   	read comp_val
	   	echo $line|sed -e "s/$/  $comp_val/" >> $fname
		continue
		;;
	D*|d*)	echo "Enter model name of diode $value e.g 1N4007"
	   	read comp_val
	   	echo $line|sed -e "s/$/  $comp_val/" >> $fname
		continue
		;;
	V*|v*)	echo "Enter value of voltage source $value
		      Note: 1.For sinusoidal source write 'SINE' (without quotes)
			    2.For DC source write 'dc'(without quotes)
			    3.For AC source write 'ac'(without quotes)" 	
		read comp_val
		echo $line|sed -e "s/$/  $comp_val/">> $fname
		continue
		;;
	RWire*) echo "Enter value of wire resistance $value if you want to include them else put zero value"
		read comp_val
		echo $line|sed -e "s/$/  $comp_val/">> $fname
		continue
		;;
	C*|c*)  echo "Enter value of capacitor $value eg 1uF "
		read comp_val
		echo $line|sed -e "s/$/  $comp_val/">> $fname
		continue
		;;
	L*|l*)  echo "Enter value of inductor $value eg 1mH"
		read comp_val
		echo $line|sed -e "s/$/  $comp_val/">> $fname
		continue
		;;
	Q*|q*)	echo "Enter type of transistor e.g npn or pnp"
		read comp_val
		echo $line|sed -e "s/$/  $comp_val/">> $fname
		continue
		;;
	*)	echo "Component not found in database"
		continue
		;;	
esac

done
comment


#Taking List of element in the circuit
awk '{print $1}' temp2_sample.txt > comp_list.txt
#Creating Reference file for future and entering value
cp temp2_sample.txt refrence.txt 

#Removing Temp File
#rm temp0_sample.txt temp1_sample.txt temp2_sample.txt
#rm $fname
exit 0

