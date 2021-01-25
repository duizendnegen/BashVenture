#!/bin/bash
clear

# Initialise the Title Art
file1="../art/titleart.ben"
while IFS= read -r line
do
    echo "$line"
done <"$file1"
echo

echo
echo "You arrive at the line 3bis terminus of \"Porte des Lilas\"."
echo "Fittingly, a flowery scent flows towards you from the south."
echo "On the west, there's the tunnel to the station you just came from."
echo "North there's just the railway tracks."
echo
echo "Rats and other rodents you don't recognise come in droves from a"
echo "small crack in the brick wall that is east."
echo
echo "What would you like to do?"

while true; do
    read -p "> " nsewui
    case $nsewui in
        n ) echo "There's metro tracks there, and a faint, very faint crackling of the electricty"
            echo "of the third rail system." ;;
        s ) ./pdl-11.sh
            exit ;;
        e ) echo "You approach the brick wall on the east but stay at a safe distance, looking at"
            echo "the rodents scurrying about." ;;
        w ) ./haxo.sh
            exit ;;
		u ) echo "You fumble in your pockets for something that would help you here. You find a lighter."
            echo "Flicking it on you find that the tiny flame gives you some reassurance that things will"
            echo "be alright. Eventually."
            echo "When the flame dies out, that reassurance disappears just as quickly." ;;
		i ) rodentstate=`cat ../logic/rodents.ben`
            if [ "$rodentstate" = "yes" ]; then
                echo "Shivering, you approach the hole in the brick wall again."
                echo "Three dog-sized rats look at you curiously. Or are they more like badgers?"
                echo "Beavers? Or, are they looking viciously?"
                sleep 3
                echo "Suddenly, a bear-sized rat with enormous teeth bursts through the small hole."
                echo "It doesn't even blink, it walks straight towards you and gnaws at your arm."
                echo "You try to run away, but it has you pinned down with it's claws."
                sleep 3
                echo "You try to scream, but you find yourself unable to make any sound."
                sleep 3
                echo "You try to wake up, but you find yourself falling to an even deeper slumber."
                sleep 3
                echo "You try to breath, but you find that you have no lungs."
                sleep 2
                echo "No body."
                sleep 2
                echo "Nothing at all."
                sleep 4
                echo
                echo
                echo "YOU ARE DEAD."
                echo
                read -p "Press [ENTER] to try again..."
                ./start.sh
                exit
            else
                echo "You inspect the hole in the brick wall. Rodents larger and larger come"
                echo "out of it. You back off when they're the size of a small dog, afraid."
                sed -i='' 's/no/yes/' ../logic/rodents.ben
            fi
             ;;
        * ) echo "Commands are: n, e, s, w, u and i.";;
    esac
done

esac
exit
