#!/bin/bash

# Temperatur von wttr.in (nur Temperatur, z.B. +20°C)
temp=$(curl -s "wttr.in?format=%t")

echo "$icon $temp"
