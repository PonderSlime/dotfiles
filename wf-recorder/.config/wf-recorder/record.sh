#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>3</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>2</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 950 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>1</b></i></span>"

sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
pactl load-module module-null-sink sink_name=Combined
pactl load-module module-loopback sink=Combined source=alsa_output.pci-0000_06_00.6.HiFi__hw_Generic_1__sink.monitor
pactl load-module module-loopback sink=Combined source=alsa_input.pci-0000_06_00.6.HiFi__hw_Generic_1__source
wf-recorder --audio=Combined.monitor --bframes max_b_frames -f $HOME/Videos/WF_RECORDER/$dateTime.mp4
