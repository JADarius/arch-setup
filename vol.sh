#!/bin/bash

# PulseAudio
# pulsemixer --change-volume $1
# PipeWire
wpctl set-volume @DEFAULT_AUDIO_SINK@ $1
kill -56 $(pidof dwmblocks) 
