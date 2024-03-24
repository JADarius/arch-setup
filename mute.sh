#!/bin/sh

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
kill -56 $(pidof dwmblocks)
