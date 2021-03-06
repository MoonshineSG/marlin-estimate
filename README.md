#GCODE print time estimation, based on Marlin 3D Printer Firmware

Based on an older version of the firmware from https://github.com/davr/Marlin/tree/estimate/Marlin


Changes:
- cleanup - removed all unnecessary codes
- check if the file parameter exists
- change the output

Used with https://github.com/MoonshineSG/Simplify3D-to-OctoPrint, it will send JSON  

```
{"human": "10 hours 56 min 12 sec","machine":39372.572320}
```

as user meta data when uploading it to Octoprint.


https://github.com/MoonshineSG/OctoPrint-Mobile (an iOS Octoprint UI) makes use of this to provide a better estimation.

The mobile ui plugin adds the time waiting for extruders to heat up, by making use of M808 start custom action. 
Add `M808 start` as the last line in the custom starting script after the bed & nozzle warm up commands M190, M109.
This needs Marlin firmware change to handle M808 (which will echo whatever parmeters sent with M808 prefixed with //action: - see https://github.com/MoonshineSG/Marlin/blob/RCBugFix/Marlin/Marlin_main.cpp#L6311 and https://github.com/MoonshineSG/Marlin/blob/RCBugFix/Marlin/Marlin_main.cpp#L7128)


gcode_estimate compiled for OSX El Capitain (10.11.4)

Note:
To specify speed / acceleration settings see the comments from the original developer at https://github.com/foosel/OctoPrint/issues/270#issuecomment-25325951
