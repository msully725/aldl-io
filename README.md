*This is a fork from [ecmhack.com](https://ecmhack.com/misc/raspberry-pi-dashboarddatalogger/)*

## overview

this is a program designed to manage aldl datastreams from the 8192 baud series
of OBD-I GM ECMs under gnu/linux based operating systems, but best tested with
EE mask LT1 ecms.

it also provides a data analysis program to assist in using massive amounts of
collected data for tuning.

see http://fbodytech.com/ for a more detailed installation tutorial, including
some raspberry pi based instructions.

## goals

* adaptable to any ecm that adheres to the standard 8192 baud aldl protocol
* low cpu use for low power devices such as raspberry pi and netbooks
* easy configuration that's easily adapted from other formats
* portable to at least ARM and x86
* highest throughput possible but with adjustable throttling
* highest connection stability and reconnect rate possible
* transparent and stupid simple api
* very easy to make plugins thread-safe
* fast and easy automatic datalogging to csv format
* simple ncurses interface for raspberry pi based dashboard

## status

the system is in daily real-world use on a test vehicle, performing full time
datalogging and display.  the goals above have all been met, and now optimization
and testing on other ecm platforms is required.

an averaging datalog analyzer is included to make logical use of massive amounts
of log data to do timing and AFR adjustments, but it may only be useful on an
LT1...

## instructions

if you're running a debian-like system, you can try to run:

./debian-config.sh

then, make && sudo make install

that might do it.  for non-debian systems, to build and run it, you'll need to:

* install libftdi and libncurses.
* build the software

check out config.h before compile if you're interested in 'tweaking' anything.

then:

make
sudo make install

* 'rmmod ftdi_sio' or, or better yet, blacklist it somehow.

this removes the the in-kernel ftdi driver.  this program uses libftdi for raw
access to the usb-serial adaptor, and will not work while ftdi_sio is loaded.

* make sure your user has permissions to read/write usb devices.

## configuration

the 'make install' command places config files in /etc/aldl by default..

they should be edited before running the program...

* aldl.conf: the root config file, specifies locations of the other config
files, as well as configures the serial driver, and a few timing options.
* lt1.conf: this is a sample definition file for an LT1 F-body or B-Body.
* datalogger.conf: configures the datalogger, including location and naming or
the logs themselves

the only thing you MIGHT have to change to get this program up and running on
an LT1 is identifying your ftdi device somehow in aldl.conf.  you should try
just running it first, it might work, the default covers MOST ftdi chipsets!

if not, using lsusb, you can find your ftdi device:

Bus 001 Device 003: ID 0424:ec00 Some FTDI Device

then look in aldl.conf. there's a PORT= line, just throw 0x in front of it,
it will search for that usb device id, and you're good to go.

PORT=i:0x424:0xEC00

## running it

aldl-dummy

that runs a test program that requires no actual vehicle, and fakes an LT1
ecm so you can check out how it behaves.

otherwise,

aldl-ftdi

you dont need to connect your usb cable, or start your car right away, it'll
sit around and wait till you do.

enjoy!
