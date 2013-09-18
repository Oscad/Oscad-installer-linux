#!/usr/bin/python
import subprocess
import os
import sys 	
import thread
from xml.etree import ElementTree as ET
from Tkinter import *
from tkFileDialog import askopenfilename
from setPath import OSCAD_HOME	

#sys.path.insert(0, '/home/fahimk/Oscad_Work/installed_OSCAD/OSCAD/forntEnd')


def main():

        root=Tk()
	global fname        
	fname = askopenfilename(filetypes=[("allfiles","*"),("pythonfiles","*.py")])
	path_dir=os.path.dirname(fname)
        print fname
	os.chdir(path_dir)
	
main()

### unzip .fzz file
subprocess.call(["xterm" ,"-e", "unzip" ,fname])

##Getting .fz and .txt file   

temp_name=os.path.splitext(os.path.basename(fname))[0]
fname1=temp_name+".fz"
fname2=temp_name+".txt"

##Parsing .fz file 
tree=ET.parse(fname1)

#Get the file object
fob=open(fname2,'w')
#Get the root module
root=tree.getroot()
#print (root)

#Getting Instances
instances=root.getchildren()[1]
#print(instances)

#Get the element instances
#print (instances.getchildren())
for instance in instances.findall('instance'):
	#print instance.getchildren()
	print "Inside a Instance"
	print instance.findtext('title')
	fob.write(str(instance.findtext('title')))
	fob.write('  ')
	
	for vews in instance.findall('views'):
		print vews.getchildren()
		print "Inside a views"
		for vew in vews.findall('breadboardView'):
			print "Inside breadboard view"
			for connectors in vew.findall('connectors'):
				print "Inside connectors"
				for connector in connectors.findall('connector'):
					print "Inside connector"
					print connector.attrib['connectorId']
					fob.write(str(connector.attrib['connectorId']))
					fob.write('  ')
					for connects in connector.findall('connects'):
						print "Inside connects"	
						for connect in connects.findall('connect'):
							print "Inside connect"
							print connect.attrib['connectorId']
							fob.write(str(connect.attrib['connectorId']))
							fob.write('  ')
				fob.write('\n')
								
fob.close()
print OSCAD_HOME
print fname2
##Calling Shell Script to manipulate file
print "Before first Script"
p1=subprocess.call([OSCAD_HOME+"/Fritzingtokicad/netlist_script.sh",fname2],stdin=None,stdout=None)
print "After First Script"

##Calling component details GUI for getting value of element
print "Before Second Script"
p2=subprocess.call([OSCAD_HOME+"/Fritzingtokicad/component_details.py",fname2],stdin=None,stdout=None)
print "After Second Script"

##Adding top comment cir file"
f=open(fname2.split('.')[0]+".cir","r+")
content=f.read()
f.seek(0,0)
f.write("****Netlist*******"+'\n'+content)
f.close()

print "End of Script"



