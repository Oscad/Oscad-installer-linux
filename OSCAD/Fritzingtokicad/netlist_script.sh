#!/bin/bash

fname=$1
#OSCAD_HOME=/home/fahimk/Oscad_Work/installed_OSCAD/OSCAD
#echo $OSCAD_HOME


#Modifying file for 14-pin Digital IC
while read line
do
count=0
if [[ $line =~ ^U_AND || $line =~ ^U_OR || $line =~ ^U_NAND || $line =~ ^U_NOR || $line =~ ^U_XOR || $line =~ ^U_XNOR ]];then
echo $line|awk '
{       mc = 0
        for(i = 2; i < NF; i += 2) {
                c = substr($i, 10) + 0
                if(c != 6 && c != 13) {
                        p[c] = $(i + 1)
                        if(c > mc) mc = c
                }
		if(c==6)
                {
                gnd = 0
                if(c>mc) mc = c
                }
                if(c==13)
                {
                vcc = $(i + 1)
                if(c>mc) mc=c
                }

        }
        lc = 0
        for(i = 0; i <= mc; i++)
                if(i in p) {
                        if(lc++ == 0) o = $1i
                        o = o "  connector" i "  " p[i]
                        if(lc == 3) {
                                print o " " gnd " " vcc
                                lc = 0
                        }
                        delete p[i]
                 }
 }' 
else
echo $line
fi
done < $fname > temp0_sample.txt  


#Removing unwanted content from output of xml file reading
sed -e "/PCB/d" -e "s/None//g" -e "s/\S*\(connector\)\S*//g" -e "s/Wire/RWire/g" temp0_sample.txt>temp1_sample.txt

##Making file proper without unwanted space
while read line
do 
echo $line
done <temp1_sample.txt>temp2_sample.txt

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
	else if ($2==0) printf "0 ",$2;	
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
	else if ($3==0) printf "0 ",$3;
	else if ($3=="") printf "\n",$3;
	else printf "error\n"
	}
	{       
             if ($4~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$4; 
        else if ($4~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$4;
        else if ($4~/pin[0-9][0-9][X]/) printf "0 ",$4;
        else if ($4~/pin[0-9][0-9][Y]/) printf "%.3sY ",$4;
        else if ($4~/pin[0-9][0-9][W]/) printf "0 ",$4;
        else if ($4~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$4;
        else if ($4~/pin[0-9][A-E]/) printf "%.4sA ",$4;
        else if ($4~/pin[0-9][F-J]/) printf "%.4sF ",$4;
        else if ($4~/pin[0-9][X]/) printf "0 ",$4;
        else if ($4~/pin[0-9][Y]/) printf "%.3sY ",$4;
        else if ($4~/pin[0-9][W]/) printf "0 ",$4;
        else if ($4~/pin[0-9][Z]/) printf "%.3sZ ",$4;
	else if ($4==0) printf "0 ",$4;
        else if ($4=="") printf "\n",$4;
        else printf "error\n"
        }
	{       
             if ($5~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$5; 
        else if ($5~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$5;
        else if ($5~/pin[0-9][0-9][X]/) printf "0 ",$5;
        else if ($5~/pin[0-9][0-9][Y]/) printf "%.3sY ",$5;
        else if ($5~/pin[0-9][0-9][W]/) printf "0 ",$5;
        else if ($5~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$5;
        else if ($5~/pin[0-9][A-E]/) printf "%.4sA ",$5;
        else if ($5~/pin[0-9][F-J]/) printf "%.4sF ",$5;
        else if ($5~/pin[0-9][X]/) printf "0 ",$5;
        else if ($5~/pin[0-9][Y]/) printf "%.3sY ",$5;
        else if ($5~/pin[0-9][W]/) printf "0 ",$5;
        else if ($5~/pin[0-9][Z]/) printf "%.3sZ ",$5;
	else if ($5==0) printf "0 ",$5;
        else if ($5=="") printf "\n",$5;
        else printf "error\n"
        }
           
	{       
             if ($6~/pin[0-9][0-9][A-E]/) printf "%.5sA\n",$6; 
        else if ($6~/pin[0-9][0-9][F-J]/) printf "%.5sF\n",$6;
	else if ($6~/pin[0-9][0-9][X]/) printf "0\n",$6;
        else if ($6~/pin[0-9][0-9][Y]/) printf "%.3sY\n",$6;
        else if ($6~/pin[0-9][0-9][W]/) printf "0\n",$6;
        else if ($6~/pin[0-9][0-9][Z]/) printf "%.3sZ\n",$6;
        else if ($6~/pin[0-9][A-E]/) printf "%.4sA\n",$6;
        else if ($6~/pin[0-9][F-J]/) printf "%.4sF\n",$6;
        else if ($6~/pin[0-9][X]/) printf "0\n",$6;
        else if ($6~/pin[0-9][Y]/) printf "%.3sY\n",$6;
        else if ($6~/pin[0-9][W]/) printf "0\n",$6;
        else if ($6~/pin[0-9][Z]/) printf "%.3sZ\n",$6;
	else if ($6==0) printf "0\n",$6;
        else if ($6=="") printf "\n",$6;
        else printf "error\n"
        }'
	
done<temp2_sample.txt>temp3_sample.txt

##Removing blank line
sed -i '/^$/d' temp3_sample.txt

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
awk '{print $1}' temp3_sample.txt > comp_list.txt
#Creating Reference file for future and entering value
cp temp3_sample.txt refrence.txt 

#Removing Temp File
#rm temp0_sample.txt temp1_sample.txt temp2_sample.txt temp3_sample.txt
#rm $fname
exit 0

