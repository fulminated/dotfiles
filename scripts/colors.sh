#!/bin/bash
#
# Author:   Twily     2014
# Requires: awk, sed and bc
#
# Useage: sh colors-hex -c|--case tolower|toupper -a|--align left|center|right -l|--line true|false -j|--jump <lines>

XPATH="/home/zeta/.Xresources"
CCASE="tolower"     # tolower|toupper
ULINE=false         # true|false
ALIGN="center"      # left|center|right
LIGHT=1             # 1|0 (highlight black color string)
JUMPL=1
CSYMB="  ██ "
CFORM="\*.color"


OPTS=`getopt -o c:l:a:j: --long case:,line:,align:,jump: -- "$@"`
eval set -- "$OPTS"

while true; do
    case "$1" in
        -c|--case) CCASE="$2"; shift 2 ;;
        -l|--line) ULINE="$2"; shift 2 ;;
        -a|--align) ALIGN="$2"; shift 2 ;;
        -j|--jump) JUMPL="$2"; shift 2 ;;
        --) shift; break ;;
        *) echo "Internal error!"; exit 1
    esac
done

TXTLEN=$(echo "(8*6)+(8*${#CSYMB})"|bc)
TRMWTH=$(echo -e "lines\ncols"|tput -S|sed -n 2p)

XRES="`cat $XPATH`"

for i in $(seq 0 $(echo $JUMPL-1|bc)); do echo -ne "\n"; done

case "$ALIGN" in
    "left") ;;
    "center") for i in $(seq 0 $(echo "(($TRMWTH-1)/2)-($TXTLEN/2)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
    "right") for i in $(seq 0 $(echo "(($TRMWTH-1))-($TXTLEN)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
esac
echo -ne "\033[1;30m$CSYMB\033[1;30m"$(echo "$XRES"|grep $CFORM'8:'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
for i in {9..15}; do
    echo -ne "\033[1;3"$(echo $i-8|bc)"m$CSYMB"$(echo "$XRES"|grep $CFORM$i':'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
done

echo -ne "\n"

case "$ALIGN" in
    "left") ;;
    "center") for i in $(seq 0 $(echo "(($TRMWTH-1)/2)-($TXTLEN/2)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
    "right") for i in $(seq 0 $(echo "(($TRMWTH-1))-($TXTLEN)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
esac
echo -ne "\033[0;30m$CSYMB\033[$LIGHT;30m"$(echo "$XRES"|grep $CFORM'0:'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
for i in {1..7}; do
    echo -ne "\033[0;3"$i"m$CSYMB"$(echo "$XRES"|grep $CFORM$i':'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
done

echo -ne "\n"

if $ULINE; then
    echo -ne "\033[1;30m"
    for i in $(seq 0 $(echo $TRMWTH-1|bc)); do echo -ne "─"; done
fi

echo -ne "\n"
