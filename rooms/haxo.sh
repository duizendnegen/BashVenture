#!/bin/bash
clear

# This is a repeat of the opening room in the start.sh file - if the player
# wants to go back to the main room, this saves going through the whole
# start script over again.

# Initialise the Title Art
file1="../art/titleart.ben"
while IFS= read -r line
do
    echo "$line"
done <"$file1"
echo

echo
echo "You walk through the dark tunnel, following the metro tracks."
echo "After less than a minute, you arrive at a station. It's the"
echo "same place you left just now."
echo
echo "Colourful but faded graffiti decorates the walls. Exfoliated "
echo "black paint on the station sign still reads \"Haxo\"."
echo
echo "In the dim light you can just see the tracks west and east."
echo "It's kind of cold, a concrete wind is blowing through the station."
echo
echo "What would you like to do?"

# And the room logic once again.
while true; do
    read -p "> " nsewui
    case $nsewui in
        n ) echo "There's just a concrete wall here, covered in graffiti." ;;
        s ) echo "Old, faded billboards decorate the walls." ;;
        e ) ticketstate=`cat ../logic/ticket.ben`
            if [ "$ticketstate" = "yes" ]; then
                ./pdf.sh
            else
                ./haxo.sh
            fi
        	exit ;;
        w ) ticketstate=`cat ../logic/ticket.ben`
            if [ "$ticketstate" = "yes" ]; then
                ./pdl-3b.sh
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
