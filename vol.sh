#!/bin/bash

pulsemixer --change-volume $1
kill -56 $(pidof dwmblocks) 
