#!/bin/bash

# Temperatur von wttr.in (nur Temperatur, z.B. +20°C)
temp=$(curl -s "wttr.in/~49.1683,8.6032?format=%t")

echo "$icon $temp"
