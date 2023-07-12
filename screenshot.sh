#!/bin/bash

maim -s >> ~/Pictures/screenshot.jpg
mv ~/Pictures/screenshot.jpg ~/Pictures/"$(date +"%F~%X").jpg"
