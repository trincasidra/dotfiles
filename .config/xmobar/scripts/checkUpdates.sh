#!/bin/sh

cupd=$(checkupdates-with-aur | wc -l)
echo "$cupd"
