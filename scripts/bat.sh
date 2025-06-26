#!/bin/bash

#mybatint=$(brightnessctl g)
#mybatint=mybatint/mybatint*100
myresult=$(brightnessctl g)
#myresult2=$(($myresult / 1060))
echo "scale=0 ; $myresult / 10.60" | bc
