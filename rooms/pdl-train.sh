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
echo "You hop on the trakcs and walk westbound for a good minute. Then, out of nowhere"
echo "loud crackling electricity signals the third rail system activating, and a sharp,"
echo "sharp grinding noise of an approaching train resounds mercilessly through the tunnel."
echo
echo "What are you going to do?"

while true; do
    read -p "> " nsewui
    case $nsewui in
        n ) echo "You try to hug the wall as the train approaches."
            sleep 3
            echo "It's no use, there's not enough room between the walls and the tracks."
            sleep 2
            echo "Out of intuition you press yourself closer still, but it's no use."
            echo "You're swept away, bleeding, broken."
            sleep 4
            echo
            echo
            echo "YOU ARE DEAD."
            echo
            read -p "Press [ENTER] to try again..."
            ./start.sh
            exit ;;
        s ) echo "You try to hug the wall as the train approaches."
            sleep 3
            echo "It's no use, there's not enough room between the walls and the tracks."
            sleep 2
            echo "Out of intuition you press yourself closer still, but it's no use."
            echo "You're swept away, bleeding, broken."
            sleep 4
            echo
            echo
            echo "YOU ARE DEAD."
            echo
            read -p "Press [ENTER] to try again..."
            ./start.sh
            exit ;;
        e ) echo "You walk, then run, towards the train, hands waving, shouting,"
            echo "frantically looking for an exit or a place to hide."
            sleep 3
            echo "Faster than you expected the train comes around the final corner."
            echo "Bright lights illuminate you, but there's no sound of breaks."
            sleep 2
            echo "You're swept away, bleeding, broken."
            sleep 4
            echo
            echo
            echo "YOU ARE DEAD."
            echo
            read -p "Press [ENTER] to try again..."
            ./start.sh
            exit ;;
        w ) echo "You run as fast as you can back to the platform,"
            echo "breathing heavily."
            sleep 3
            echo "Faster than you expected the train comes around the final corner."
            echo "Bright lights illuminate you, but there's no sound of breaks."
            sleep 2
            echo "You're swept away, bleeding, broken."
            sleep 4
            echo
            echo
            echo "YOU ARE DEAD."
            echo
            read -p "Press [ENTER] to try again..."
            ./start.sh
            exit ;;
		u ) echo "You have nothing on you that would be able to stop an oncoming train." ;;
		i ) echo "You look around you and see a trap door, which you hastily open."
            echo "Without thinking what it could contain you jump into the hole it reveals"
            echo "and close the door overhead."
            sleep 2
            echo "You hear the train passing, your heart is still pounding in your chest."
            sleep 2
            echo "The small hole you're in is illuminated brightly, but you can't detect"
            echo "the source of the light. It does show you a code in a note on the floor:"
            echo "'2384'."
            sleep 3
            echo "You open the hatch again and walk westwards, back to the platform."
            sleep 4
            sed -i='' 's/no/yes/' ../logic/code.ben
            ./pdl-11.sh
            exit ;;
        * ) echo "Commands are: n, e, s, w, u and i.";;
    esac
done

esac
exit
