#!/bin/bash

curl -XGET https://developer.valvesoftware.com/wiki/List_of_CS:GO_Cvars |\
grep '<td><a' |\
sed 's|.*>\(.*\)</a>|\1|g' |\
sed s/\'//g > cvar_dict.txt
