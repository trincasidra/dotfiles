amixeroutput=$(amixer sget Master)
vol=$(awk -F"[][]" '/Left:/ { print $2 }' <<< ${amixeroutput})
if [[ $amixeroutput == *"[off]"* ]]; then
    vol="muted"
fi
echo $vol
exit 0
