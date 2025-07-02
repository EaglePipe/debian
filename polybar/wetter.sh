#!/bin/bash

# Temperatur abfragen
temp=$(curl -s "wttr.in/~49.1683,8.6032?format=%t")


# Anzeige mit Font-Tag für font-3 (Noto Color Emoji)
echo "%{T3}%{T-} $temp"
