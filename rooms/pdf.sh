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
echo "You arrive at the slightly curved platform 2bis of \"Places des"
echo " Fêtes\". The airtight doors for the bomb shelter are hermetically"
echo "sealed."
echo ""
echo "Several passengers are waiting for the metro, oblivious to the"
echo "fact that they're completely locked in, and no metros are running."
echo "In the middle of the platform there's a safe, in a reflective, oily "
echo "colour. The passengers are unaware of this strange artefact much"
echo "the same."
echo
echo "What would you like to do?"

while true; do
    read -p "> " nsewui
    case $nsewui in
        n ) echo "The bomb shelter doors are hermetically shut." ;;
        s ) echo "There's metro tracks there, and a faint, very faint grinding of steel wheels." ;;
        e ) ./haxo.sh
        	exit ;;
        w ) echo "You are about to hop on the track to leave the station this way when"
            echo "a strong force holds you back. You turn around but there's nobody there."
            echo "You back off slightly and the tight grip it had on you loosens." ;;
		u ) keystate=`cat ../logic/key.ben`
            if [ "$keystate" = "yes" ]; then
                echo "The safe swings open, and with a wooshing sounds, so do the bomb shelter doors"
                echo "all around you. All passengers start streaming out, without saying a word."
                sleep 2
                echo "In the safe, a single piece of paper reads one word: \"Telegraph\"."
                echo "There's a notion in the back of your mind that this is significant, that this is"
                echo "crucial to understanding something that's bigger than you."
                sleep 2
                echo "Suddenly relieved, you start making for the stairs. A breeze of fresh air"
                echo "makes you feel alive, and hopeful."
                sleep 4
                ./end.sh
                exit
            else
                echo "You try to lift the safe, but it's much heavier than it looks."
                echo "Breathing heavily, and sweating, hot, inexpliciably, you give up."
            fi
             ;;

		i ) echo "You inspect the safe. There's a tiny keyhole on the top, the size of a paperclip." ;;
        * ) echo "Commands are: n, e, s, w, u and i.";;
    esac
done

esac
exit
