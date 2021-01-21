#!/bin/bash

echo
file1="../art/bigfinish.ben"
while IFS= read -r line
do
    echo "$line"
done <"$file1"
echo
echo
read -p "Press [ENTER] to exit..."
echo
clear

# That's all, folks!

exit
