#!/bin/bash

#Generated with https://max.io/bash.html

#Background Colors
E=$(tput sgr0);    R=$(tput setab 1); G=$(tput setab 2); Y=$(tput setab 3);
B=$(tput setab 4); M=$(tput setab 5); C=$(tput setab 6); W=$(tput setab 7);
function e() { echo -e "$E"; }
function x() { echo -n "$E  "; }
function r() { echo -n "$R  "; }
function g() { echo -n "$G  "; }
function y() { echo -n "$Y  "; }
function b() { echo -n "$B  "; }
function m() { echo -n "$M  "; }
function c() { echo -n "$C  "; }
function w() { echo -n "$W  "; }

#putpixels
function u() {
    h="$*";o=${h:0:1};v=${h:1};
    for i in `seq $v`
    do
        $o;
    done
}

img="\
x40 e1 x40 e1 x14 w7 x19 e1 x13 w2 x2 w1 x2 w2 x18 e1 x12 w2 x3 w1 x3 w2 x17 e1 x12 w1 x4 w1 x4 w1 x17 e1 x12 w1 x4 w1 x4 w1 x17 e1 x12 w1 x4 w1 x4 w1 x17 e1 x12 w2 x3 w1 x3 w2 x17 e1 x13 w2 x2 w1 x2 w2 x18 e1 x14 w7 x19 e1 x17 w4 x19 e1 x17 w1 x2 w2 x18 e1 x17 w1 x3 w1 x18 e1 x17 w1 x3 w2 x17 e1 x17 w6 x17 e1 x17 w1 x4 w1 x17 e1 x17 w1 x4 w1 x17 e1 x17 w1 x4 w1 x17 e1 x17 w1 x4 w1 x17 e1 x40 e1 x40 e1 x40"

for n in $img
do
    u $n
done
e;
exit 0;
