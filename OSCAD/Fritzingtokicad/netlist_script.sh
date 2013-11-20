#!/bin/bash

fname=$1
#OSCAD_HOME=/home/fahimk/Oscad_Work/installed_OSCAD/OSCAD
#echo $OSCAD_HOME

sed -e "s/None//g" $fname > temp00_sample.txt

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
	mcu = mc
	mcl = mc - 7
	for(i = 0; i <= mcl; i++)
	{
                if(i in p) {
                        if(lc++ == 0) o = $1i
                        o = o "  connector" i "  " p[i]
                        if(lc == 3) {
                                print o " " gnd " " vcc
                                lc = 0
                        }
                        delete p[i]
                 }
		
	}
        lc = 0
	for(j = mcu; j>6; j--)
	{
		if(j in p) {
			if(lc++ == 0) o = $1j
			o = o "  connector" j " " p[j]
			if(lc == 3) {
				print o " " gnd " " vcc
				lc = 0
			}
			delete p[j]
		}
     }
 }' 

elif [[ $line =~ ^U_NOT ]];then
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
	    mcu = mc
        mcl = mc - 7
        for(i = 0; i <= mcl; i++){
                if(i in p) {
                        if(lc++ == 0) o = $1i
                        o = o "  connector" i "  " p[i]
                        if(lc == 2) {
                                print o " " gnd " " vcc
                                lc = 0
                        }
                        delete p[i]
                 }
	}
        lc = 0
	for(j=mcu; j>6; j--){
                if(j in p) {
                        if(lc++ == 0) o = $1j
                        o = o "  connector" j "  " p[j]
                        if(lc == 2) {
                                print o " " gnd " " vcc
                                lc = 0
                        }
                        delete p[j]
                 }
        }
 }'

elif [[ $line =~ ^U_DFF ]];then
echo $line|awk '
{       
        for(i = 2; i < NF; i += 2) {
                c = $i
                if(c != "gnd" && c != "vcc") {
			
			if(c=="d1") { d1 = $(i +1) }
			else if(c=="d2") { d2 = $(i + 1) }
			else if(c=="clk1") { clk1 = $(i+1) }
			else if(c=="clk2") { clk2 = $(i+1) }
			else if(c=="set1") { set1 = $(i+1) }
			else if(c=="set2") { set2 = $(i+1) }
			else if(c=="reset1") { reset1 = $(i+1) }
			else if(c=="reset2") { reset2 = $(i+1) }
			else if(c=="q1") { q1=$(i+1) }
			else if(c=="q2") { q2=$(i+1) }
			else if(c=="qbar1") { qbar1=$(i+1) }
			else if(c=="qbar2") { qbar2=$(i+1) } 
                 }
		if(c=="gnd")
                {
                gnd = 0
                }
                if(c=="vcc")
                {
                vcc = $(i + 1)
                }
	}
		print $1"0 " reset1" "d1" "clk1" "set1" "q1" "qbar1" "gnd" "vcc 
		print $1"1 " reset2" "d2" "clk2" "set2" "q2" "qbar2" "gnd" "vcc
}'

elif [[ $line =~ ^U_JKFF ]];then
echo $line|awk '
{       
        for(i = 2; i < NF; i += 2) {
                c = $i
                if(c != "gnd" && c != "vcc") {
			
			if(c=="j1") { j1 = $(i+1) }
			else if(c=="k1") { k1 = $(i+1) }
			else if(c=="j2") { j2=$(i+1) }
			else if(c=="k2") { k2=$(i+1) }
			else if(c=="clk1") { clk1 = $(i+1) }
			else if(c=="clk2") { clk2 = $(i+1) }
			else if(c=="set1") { set1 = $(i+1) }
			else if(c=="set2") { set2 = $(i+1) }
			else if(c=="reset1") { reset1 = $(i+1) }
			else if(c=="reset2") { reset2 = $(i+1) }
			else if(c=="q1") { q1=$(i+1) }
			else if(c=="q2") { q2=$(i+1) }
			else if(c=="qbar1") { qbar1=$(i+1) }
			else if(c=="qbar2") { qbar2=$(i+1) } 
                }
		if(c=="gnd")
                {
                gnd = 0
                }
                if(c=="vcc")
                {
                vcc = $(i + 1)
                }
	}
		print $1"0 " reset1" "j1" "k1" "clk1" "set1" "q1" "qbar1" "gnd" "vcc 
		print $1"1 " reset2" "j2" "k2" "clk2" "set2" "q2" "qbar2" "gnd" "vcc
}'

elif [[ $line =~ ^U_SRFF ]];then
echo $line|awk '
{       
        for(i = 2; i < NF; i += 2) {
                c = $i
                if(c != "gnd" && c != "vcc") {
			
			if(c=="s1") { s1 = $(i+1) }
			else if(c=="s2") { s2 = $(i+1) }
			else if(c=="r1") { r1 = $(i+1) }
			else if(c=="r2") { r2 = $(i+1) }
			else if(c=="clk1") { clk1 = $(i+1) }
			else if(c=="clk2") { clk2 = $(i+1) }
			else if(c=="set1") { set1 = $(i+1) }
			else if(c=="set2") { set2 = $(i+1) }
			else if(c=="reset1") { reset1 = $(i+1) }
			else if(c=="reset2") { reset2 = $(i+1) }
			else if(c=="q1") { q1=$(i+1) }
			else if(c=="q2") { q2=$(i+1) }
			else if(c=="qbar1") { qbar1=$(i+1) }
			else if(c=="qbar2") { qbar2=$(i+1) }
			
                 }
		if(c=="gnd")
                {
                gnd = 0
                }
                if(c=="vcc")
                {
                vcc = $(i + 1)
                }
	}
		print $1"0 " reset1" "s1" "r1" "clk1" "set1" "q1" "qbar1" "gnd" "vcc
		print $1"1 " reset2" "s2" "r2" "clk2" "set2" "q2" "qbar2" "gnd" "vcc
}'

elif [[ $line =~ ^U_TFF ]];then
echo $line|awk '
{       
        for(i = 2; i < NF; i += 2) {
                c = $i
                if(c != "gnd" && c != "vcc") {
			
			if(c=="t1") { t1 = $(i +1) }
			else if(c=="t2") { t2 = $(i + 1) }
			else if(c=="clk1") { clk1 = $(i+1) }
			else if(c=="clk2") { clk2 = $(i+1) }
			else if(c=="set1") { set1 = $(i+1) }
			else if(c=="set2") { set2 = $(i+1) }
			else if(c=="reset1") { reset1 = $(i+1) }
			else if(c=="reset2") { reset2 = $(i+1) }
			else if(c=="q1") { q1=$(i+1) }
			else if(c=="q2") { q2=$(i+1) }
			else if(c=="qbar1") { qbar1=$(i+1) }
			else if(c=="qbar2") { qbar2=$(i+1) } 
                 }
		if(c=="gnd")
                {
                gnd = 0
                }
                if(c=="vcc")
                {
                vcc = $(i + 1)
                }
	}
		print $1"0 " reset1" "t1" "clk1" "set1" "q1" "qbar1" "gnd" "vcc 
		print $1"1 " reset2" "t2" "clk2" "set2" "q2" "qbar2" "gnd" "vcc
}'
else
echo $line

fi
done < temp00_sample.txt > temp0_sample.txt  


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
             if ($6~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$6; 
        else if ($6~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$6;
	else if ($6~/pin[0-9][0-9][X]/) printf "0 ",$6;
        else if ($6~/pin[0-9][0-9][Y]/) printf "%.3sY ",$6;
        else if ($6~/pin[0-9][0-9][W]/) printf "0 ",$6;
        else if ($6~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$6;
        else if ($6~/pin[0-9][A-E]/) printf "%.4sA ",$6;
        else if ($6~/pin[0-9][F-J]/) printf "%.4sF ",$6;
        else if ($6~/pin[0-9][X]/) printf "0 ",$6;
        else if ($6~/pin[0-9][Y]/) printf "%.3sY ",$6;
        else if ($6~/pin[0-9][W]/) printf "0 ",$6;
        else if ($6~/pin[0-9][Z]/) printf "%.3sZ ",$6;
	else if ($6==0) printf "0 ",$6;
        else if ($6=="") printf "\n",$6;
        else printf "error\n"
        }
	
	{       
             if ($7~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$7; 
        else if ($7~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$7;
	else if ($7~/pin[0-9][0-9][X]/) printf "0 ",$7;
        else if ($7~/pin[0-9][0-9][Y]/) printf "%.3sY ",$7;
        else if ($7~/pin[0-9][0-9][W]/) printf "0 ",$7;
        else if ($7~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$7;
        else if ($7~/pin[0-9][A-E]/) printf "%.4sA ",$7;
        else if ($7~/pin[0-9][F-J]/) printf "%.4sF ",$7;
        else if ($7~/pin[0-9][X]/) printf "0 ",$7;
        else if ($7~/pin[0-9][Y]/) printf "%.3sY ",$7;
        else if ($7~/pin[0-9][W]/) printf "0 ",$7;
        else if ($7~/pin[0-9][Z]/) printf "%.3sZ ",$7;
	else if ($7==0) printf "0 ",$7;
        else if ($7=="") printf "\n",$7;
        else printf "error\n"
        }
	
	{       
             if ($8~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$8; 
        else if ($8~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$8;
	else if ($8~/pin[0-9][0-9][X]/) printf "0 ",$8;
        else if ($8~/pin[0-9][0-9][Y]/) printf "%.3sY ",$8;
        else if ($8~/pin[0-9][0-9][W]/) printf "0 ",$8;
        else if ($8~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$8;
        else if ($8~/pin[0-9][A-E]/) printf "%.4sA ",$8;
        else if ($8~/pin[0-9][F-J]/) printf "%.4sF ",$8;
        else if ($8~/pin[0-9][X]/) printf "0 ",$8;
        else if ($8~/pin[0-9][Y]/) printf "%.3sY ",$8;
        else if ($8~/pin[0-9][W]/) printf "0 ",$8;
        else if ($8~/pin[0-9][Z]/) printf "%.3sZ ",$8;
	else if ($8==0) printf "0 ",$8;
        else if ($8=="") printf "\n",$8;
        else printf "error\n"
        }

	{       
             if ($9~/pin[0-9][0-9][A-E]/) printf "%.5sA ",$9; 
        else if ($9~/pin[0-9][0-9][F-J]/) printf "%.5sF ",$9;
	else if ($9~/pin[0-9][0-9][X]/) printf "0 ",$9;
        else if ($9~/pin[0-9][0-9][Y]/) printf "%.3sY ",$9;
        else if ($9~/pin[0-9][0-9][W]/) printf "0 ",$9;
        else if ($9~/pin[0-9][0-9][Z]/) printf "%.3sZ ",$9;
        else if ($9~/pin[0-9][A-E]/) printf "%.4sA ",$9;
        else if ($9~/pin[0-9][F-J]/) printf "%.4sF ",$9;
        else if ($9~/pin[0-9][X]/) printf "0 ",$9;
        else if ($9~/pin[0-9][Y]/) printf "%.3sY ",$9;
        else if ($9~/pin[0-9][W]/) printf "0 ",$9;
        else if ($9~/pin[0-9][Z]/) printf "%.3sZ ",$9;
	else if ($9==0) printf "0 ",$9;
        else if ($9=="") printf "\n",$9;
        else printf "error\n"
        }

	{       
             if ($10~/pin[0-9][0-9][A-E]/) printf "%.5sA\n",$10; 
        else if ($10~/pin[0-9][0-9][F-J]/) printf "%.5sF\n",$10;
	else if ($10~/pin[0-9][0-9][X]/) printf "0\n",$10;
        else if ($10~/pin[0-9][0-9][Y]/) printf "%.3sY\n",$10;
        else if ($10~/pin[0-9][0-9][W]/) printf "0\n",$10;
        else if ($10~/pin[0-9][0-9][Z]/) printf "%.3sZ\n",$10;
        else if ($10~/pin[0-9][A-E]/) printf "%.4sA\n",$10;
        else if ($10~/pin[0-9][F-J]/) printf "%.4sF\n",$10;
        else if ($10~/pin[0-9][X]/) printf "0\n",$10;
        else if ($10~/pin[0-9][Y]/) printf "%.3sY\n",$10;
        else if ($10~/pin[0-9][W]/) printf "0\n",$10;
        else if ($10~/pin[0-9][Z]/) printf "%.3sZ\n",$10;
	else if ($10==0) printf "0\n",$10;
        else if ($10=="") printf "\n",$10;
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

