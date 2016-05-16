#!/bin/bash

echo "*** Updating Marlin Estimate ..."
echo

#point to the correct folder
cd /Volumes/Data/Projects/3D/marlin-estimate/

#Z_AXIS_STEPS_PER_UNIt can be removed (used in my custom Marlin firmware)
for VARIABLE in Z_AXIS_STEPS_PER_UNIT DEFAULT_AXIS_STEPS_PER_UNIT DEFAULT_MAX_FEEDRATE DEFAULT_MAX_ACCELERATION DEFAULT_ACCELERATION DEFAULT_RETRACT_ACCELERATION DEFAULT_TRAVEL_ACCELERATION DEFAULT_XYJERK DEFAULT_ZJERK DEFAULT_EJERK
do
  echo ">>> updating $VARIABLE..."
  
  #point to the correct file
  VALUE=`awk '/#define '"$VARIABLE"'(.*)/{print $0}' /Volumes/Data/Projects/3D/Marlin/Marlin/Configuration.h`
  VALUE_ESC=$(sed 's/[\*\.\(\)\/]/\\&/g' <<<"$VALUE")
  sed -i.bak "s/#define $VARIABLE.*/$VALUE_ESC/"  Configuration.h
done
echo
make --quiet