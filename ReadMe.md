# Open Source Computer Aided Design

![OSCAD logo](./OSCAD/images/logo.png "OSCAD logo")

## About

OSCAD is a free and open source EDA tool created using open source
packages, such as KiCad, NgSpice, Scilab and Python. OSCAD can be used
to create circuit schematics, perform simulations and design PCB
layouts. It can also create or edit new device models, and
sub-circuits for simulations. It has Scilab based Mini Circuit
Simulator(SMCSim), which gives the circuit equation for each simulated
step. This feature is unique to OSCAD.


## System requirement

* Ubuntu 12.04(32/64-bits) or later
* Scilab 5.4.0 or later
* KiCad(Optional, will be installed by OSCAD installer)
* NgSpice(Optional, will be installed by OSCAD  installer)
* Python modules(Optional, will be installed by OSCAD installer)
* Fritzing Module(0.8.3 or later) will be installed by OSCAD installer

## Install

* On the terminal, enter this directory

      cd Oscad-installer-linux

* Execute the installer script

      sudo bash ./installOSCAD.sh

* You may have to give proxy-server credentials when prompted

* Please refer the Chapter-2 from
  [Oscad book](http://www.oscad.in/resource/book/oscad.pdf) for detail
  install instructions

## Usage

Please refer Chapter 4 for detailed usage. Note that Fritzing
simulation through OSCAD is meant for analog components, however one
can get schematic and PCB views for all components.

## Documentation

Entire documentation and usage is assembled in
[Oscad book](http://www.oscad.in/resource/book/oscad.pdf)


## Contribute

* You can contribute to Source code as well as documentation
* Fork this repo
* Make a separate branch. Branch name should reflect your new feature
  or a module
* Send us a pull request

## Contact

[www.oscad.in](http://www.oscad.in/)

## License

OSCAD is distributed under
[GNU GPL Version 3](http://www.gnu.org/licenses/gpl-3.0.txt)

All rights belong to the National Mission on Education through ICT,
MHRD, Government of India.

