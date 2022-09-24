#!/bin/bash
# Author: Tom Mertens
# Email: tommertensjobapplication@gmail.com
# Date: 24/09/2022


# simple log file to show what the script is doing
logfile=clean.log
echo "Log file for cleanup.sh" > "${logfile}"

# set to desired value - could be implemented as arg/option
linesToKeep=20000

# generate a directory tree to test the script
# usage:
#   sudo bash cleanup.sh "generate"
if [ $1 == "generate" ] ; then
echo Generating test tree...

# clear previous
rm -rf test

# create dir
mkdir -p test/test01
mkdir -p test/test02
mkdir -p test/test03
mkdir -p test/test04

# create files
touch test/test01/.prune-enable
touch test/test01/crash.dump

touch test/test03/.prune-enable

touch test/test04/.prune-enable
touch test/test04/crash.dump
touch test/test04/test.log
touch test/test04/testlarge.log

# create log files with random data to have test tail (bin)
dd if=/dev/urandom of=test/test04/test.log.bin bs=1k count=10
dd if=/dev/urandom of=test/test04/testlarge.log.bin bs=1M count=10

# extract string values (wc -l and tail not consistent due to newline symbols in the bin format)
strings test/test04/test.log.bin > test/test04/test.log
strings test/test04/testlarge.log.bin > test/test04/testlarge.log
fi

# find in /opt all files '.prune-enable', extract the directory name and loop
find . -name ".prune-enable" -printf '%h\n' | while read line;
do
   echo "Found .prune-enable in ${line}" >> "${logfile}"
   fileToRem="${line}/crash.dump";

   # if found delete the crash.dump
   if [ -f "${fileToRem}" ] ; then
        echo "Deleting crash.dump in ${line}" >> "${logfile}" 
	    rm "${fileToRem}"
   fi

   # find log files 
   logfiles="${line}/*.log"
   for log in $logfiles; 
   do
       # if file exist (skip boundary cases when no log files are found)
	   [ -e ${log} ] || continue
	   # uncomment for debug
       # wc -l $log
       echo "Processing max lines for ${log}" >> "${logfile}"
       # use additional temp file to avoid possible race condition on read-write
	   tail -n "${linesToKeep}" $log > tmp.log
	   mv tmp.log $log
	   # uncomment for debug
       # wc -l $log
   done
done
