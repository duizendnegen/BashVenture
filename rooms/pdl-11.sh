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
echo "The line 11 station of \"Porte des Lilas\" is a grey concrete slab"
echo "indistinguishable from other metro station."
echo "On the west, there's a grey cabin, for station attendants, presumably,"
echo "you can't quite tell. North you smell the flowery scents coming from"
echo "the platform where the 3bis line calls."
echo "East there's the metro tunnel, which draws you so, so strongly,"
echo "but repells you at the same time: impeding opportunity, impeding"
echo "mortal danger."
echo
echo "What would you like to do?"

while true; do
    read -p "> " nsewui
    case $nsewui in
        n ) ./pdl-3b.sh
            exit ;;
        s ) echo "There's railway tracks on the south. Railways tracks, once again."
            echo "They're everywhere. Maddening." ;;
        e ) ./pdl-train.sh
            exit ;;
        w ) keystate=`cat ../logic/key.ben`
            if [ "$keystate" = "yes" ]; then
                echo "You approach the cabin, open the door, look around, but there's nothing"
                echo "to be found."
            else
                codestate=`cat ../logic/code.ben`
                if [ "$codestate" = "yes" ]; then
                    echo "You approach the cabin and enter the key code."
                    echo "It swings open and reveals a room only containing wooden desk, on"
                    echo "it a beautiful, small, brass key."
                    sleep 2
                    echo "You pick up the key, and close the door again."
                    sed -i='' 's/no/yes/' ../logic/key.ben
                else
                    echo "A small grey cabin at the west end of the platform prompts you with a"
                    echo "four-digit code to fill in. You draw blanks as for what to enter."
                fi
            fi
             ;;
		u ) echo "Nothing springs to mind as for what to use."
            echo "You feel quite empty." ;;
		i ) echo "You look around you, but nothing in particular draws your attention." ;;
        * ) echo "Commands are: n, e, s, w, u and i.";;
    esac
done

esac
exit
