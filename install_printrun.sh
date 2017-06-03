#!/bin/sh

BASEDIR="$HOME/RepRap" # edit this is you don't want it installed in your home directory

PRINTRUNDIR="$BASEDIR/Printrun" # Defines where the 'Printrun' directory is located. But of course
                                # you can change this to say: "$HOME/Documents/Create/RepRap/Printrun".

SKEINFORGEDIR="$PRINTRUNDIR/skeinforge" #Defines where the 'skeinforge' directory is located in the
                                # 'Printrun' directory is located.

SKEINFORGEBASEURL="http://members.axion.net/~enrique/"
SKEINFORGEFILENAME="reprap_python_beanshell.zip"

mkdir -p "$BASEDIR"
cd "$BASEDIR"  # Change directory to the executing users home directory.

echo "Moving existing Printrun directory..."
mv "$PRINTRUNDIR" "$PRINTRUNDIR.old.$$"  # save old installation

echo "Cloning Printrun..."
git clone https://github.com/kliment/Printrun.git # See also: http://help.github.com/linux-set-up-git/

echo "Grabbing skeinforge..."
wget -P /tmp "$SKEINFORGEBASEURL$SKEINFORGEFILENAME" # download skeinforge zip

echo "Unzipping skeinforge into Printrun directory..."
unzip -d "$SKEINFORGEDIR" "/tmp/$SKEINFORGEFILENAME" # unzips the grabbed zip to ones defined skeinforge dir.

echo "Symlinking skeinforge inside Printrun directory..."
ln -s "$SKEINFORGEDIR/"* "$PRINTRUNDIR/" # Script makes a symbolic link.

echo "Cleaning up temporary installation files..."
rm -rf "/tmp/$SKEINFORGEFILENAME" # Removes tmp files.
