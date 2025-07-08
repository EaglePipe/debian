#!/bin/bash

# Temperatur abfragen (Ubstadt-Weiher)
temp=$(curl -s "wttr.in/~49.1628,8.6291?format=%t")

# Anzeige mit Font-Tag für font-3 (z. B. Nerd Font Icon oder Emoji)
echo "%{T3}%{T-} $temp"
