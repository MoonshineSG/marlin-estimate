#GCODE print time estimation, based on Marlin 3D Printer Firmware

Based on an older version of the firmware from https://github.com/davr/Marlin/tree/estimate/Marlin

Changes:
- cleanup - removed all unnecessary codes
- check if the file parameter exists
- change the output

Used with https://github.com/MoonshineSG/Simplify3D-to-OctoPrint, it will append 

```
;estimative time to print: 00 hours 26 min 25 sec
;marlin_estimate:1585.558610
```
at the end of the gcode file file before uploading it to Octoprint.


https://github.com/MoonshineSG/OctoPrint-Mobile (an iOS Octoprint UI) makes use of this to provide a better estimation.

gcode_estimate compiled for OSX El Capitain (10.11.4)