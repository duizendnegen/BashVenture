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

echo
echo "You find yourself at an underground platform. Rail tracks a"
echo "third rail system of a single metro line stretch out west to"
echo "east."
echo "Colourful but faded graffiti decorates the walls. Exfoliated "
echo "black paint on the station sign still reads \"Haxo\"."
echo
echo "In the dim light you can just see the tracks west and east."
echo "It's kind of cold, a concrete wind is blowing through the station."
echo
echo "What would you like to do?"

# Now we wait for their response - and send them somewhere accordingly.
while true; do
    read -p "> " nsewui
    case $nsewui in
        n ) echo "There's just a concrete wall here, covered in graffiti." ;;
        s ) echo "Old, faded billboards decorate the walls." ;;
        e ) ticketstate=`cat ../logic/ticket.ben`
            if [ "$ticketstate" = "yes" ]; then
                ./pdl-3b.sh
            else
                ./haxo.sh
            fi
        	exit ;;
        w ) ticketstate=`cat ../logic/ticket.ben`
            if [ "$ticketstate" = "yes" ]; then
                ./pdf.sh
            else
                ./haxo.sh
            fi
        	exit ;;
		u ) ticketstate=`cat ../logic/ticket.ben`
            if [ "$ticketstate" = "yes" ]; then
                echo "You toss another coin in the ticket machine, but nothing happens."
                echo "No rattle, no clattering of the coin as it navigates the insides"
                echo "of the machine. Just, nothing."
                echo "Complete silence."
            else
                sed -i='' 's/no/yes/' ../logic/ticket.ben
                echo "Trying your luck, you throw a coin you had in your wallet in the ticket machine."
                echo "The old machine rattles to life, and a small paper ticket floats to the floor."
                echo "You pick it up and put it in your pocket."
            fi
             ;;

		i ) echo "You look around and see a ticket machine in the far corner of the platform." ;;
        * ) echo "Commands are: n, e, s, w, u and i.";;
    esac
done

esac
exit
