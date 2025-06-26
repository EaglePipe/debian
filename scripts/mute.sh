#!/bin/bash

mymutestatus=$(pamixer --get-mute)
echo "Mute is: $mymutestatus"

if [ "$mymutestatus" = "false" ]
then
  echo "Mute on"
  pamixer -m
  exit 0
else
  echo "Mute off"
  pamixer -u
  exit 0
fi


