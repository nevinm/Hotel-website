#!/bin/bash

echo "--------------------------------------------------------------------"
echo "Initializing . . . "
echo "Going to change $1 to $2 in the files:"
echo "___________________ PROCESS STARTING - Input Files:_________________"
echo ""
echo ""
grep -r $1 --color=auto
grep -rl $1 > files
#Replace Logic:
echo ""
for i in $(cat files)
do
	replace $1 $2 -- $i
done

echo "____________________ PROCESS COMPLETED - Output Files:_______________"
echo ""
echo ""
grep -r $2 --color=auto
echo ""
echo "--------------------------------------------------------------------"
