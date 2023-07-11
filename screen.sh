#!/bin/bash

xbacklight -$1 $2
kill -55 $(pidof dwmblocks) 
