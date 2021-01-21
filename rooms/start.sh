#!/bin/bash

clear

# Logic in the game is stored in .ben files. This sample has just one 'logic' file.
# You can add more logic files by simply adding a 'sed' command and appropriate .ben file.
# First off, let us reset the game logic. Use this as an example.

sed -i='' 's/on/off/' ../logic/leverlogic.ben

# Who doen't love ASCII text, right?
# Next up, let's initialise the Title Art
file1="../art/titleart.ben"
while IFS= read -r line
do
	echo "$line"
done <"$file1"
echo

# Next up, let's load in the initial introduction. Script is also stored in .ben files.
sleep 5
file2="../script/opening.ben"
while IFS= read -r line
do
	echo "$line"
done <"$file2"
read -p "Press [ENTER] to start..."

#Okay, now that the introduction is out of the way, we can start the first room!
clear
file1="../art/titleart.ben"
while IFS= read -r line
do
	echo "$line"
done <"$file1"
sleep 1

# Here's where you introduce the room to the player. Be sure to tell them if there
# Are exits - but don't give too much away. Make it fun for them to explore!
echo
echo "You find yourself at an underground platform. Rail tracks a"
echo "third rail system of a single metro line stretch out west to"
echo "east."
echo "Colourful but faded graffiti decorates the walls. Exfoliated "
echo "black paint on the station sign still reads \"Haxo\"."
echo
echo "In the dim light you can just see the tracks west and east."
echo "It's kinda cold, a concrete wind is blowing through the station."
echo
echo "What would you like to do?"

# Now we wait for their response - and send them somewhere accordingly.
while true; do
    read -p "> " nsewuh
    case $nsewuh in
        n ) echo "There's just a concrete wall here, covered in graffiti." ;;
        s ) echo "Old, faded billboards decorate the walls." ;;
        e ) ./pdf.sh
        	exit ;;
        w ) ./pdl-3b.sh
        	exit ;;
		u ) echo "Trying your luck, you throw a coin you had in your wallet in the ticket machine."
            echo "The old machine rattles to life, and a small paper ticket floats to the floor."
            echo "You pick it up and put it in your pocket." ;;
		i ) echo "You look around and see a ticket machine in the far corner of the platform." ;;
        * ) echo "Commands are: n, e, s, w, u and i.";;
    esac
done

esac
exit
