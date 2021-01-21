#!/bin/bash

# Here we check to see if uuidgen is installed - if not it will default to single-user mode. To run this on a server
# and support multipe-users, check you have everthing set up correctly. Follow the instructions in the ReadMe file on GitHub.

if hash uuidgen 2>/dev/null; then
homefolder=$(pwd)
newplayer=sessions/$(uuidgen)
mkdir $newplayer
cp -r rooms $newplayer/rooms
cp -r art $newplayer/art
cp -r script $newplayer/script
cp -r logic $newplayer/logic
fi

echo "Loading..."
echo
sleep 4
if hash uuidgen 2>/dev/null; then
cd $newplayer/rooms
else
cd rooms
fi
./start.sh
if hash uuidgen 2>/dev/null; then
cd "$homefolder"
rm -r $newplayer
fi
echo
exit
