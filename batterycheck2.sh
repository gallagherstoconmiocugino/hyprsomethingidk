#!/bin/bash

done1=0
done2=0
done3=0
done4=0
done5=0

while true; do
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
    if [ "$STATUS" == "Charging" ]; then
       if [ $done1 -eq 0 ]; then
       done1=1
       done2=0
       done3=0
       done4=0
       done5=0
       pw-play /home/simone/Musica/battery2.mp3
       dunstify -i "/usr/share/icons/AdwaitaLegacy/48x48/legacy/ac-adapter.png" "Battery Charging" "Level is at ${CAPACITY}%"
    fi
 else
  if [ $done1 -eq 1 ]; then
  done1=0
  done2=0
  done3=0
  done4=0
  done5=0
  fi
  if [ "$CAPACITY" -lt 21 ]; then
  if [ "$CAPACITY" -gt 15 ]; then
     if [ $done1 -eq 0 ] && [ $done2 -eq 0 ]; then
     done1=0
     done2=1
     done3=0
     done4=0
     done5=0
     pw-play /home/simone/Musica/battery.mp3
     dunstify -i "/usr/share/icons/AdwaitaLegacy/48x48/legacy/battery-caution.png" "Battery Warning" "Level is at ${CAPACITY}%" -u critical
      fi
   elif [ "$CAPACITY" -gt 10 ] && [ "$CAPACITY" -le 15 ]; then
       if [ $done1 -eq 0 ] && [ $done3 -eq 0 ]; then
       done1=0
       done2=1
       done3=1
       done4=0
       done5=0
       pw-play /home/simone/Musica/battery.mp3
       dunstify -i "/usr/share/icons/AdwaitaLegacy/48x48/legacy/battery-caution.png" "Battery Warning" "Level is at ${CAPACITY}%" -u critical
     fi
  elif [ "$CAPACITY" -gt 5 ] && [ "$CAPACITY" -le 10 ]; then
       if [ $done1 -eq 0 ] && [ $done4 -eq 0 ]; then
       done1=0
       done2=1
       done3=1
       done4=1
       done5=0
       pw-play /home/simone/Musica/battery.mp3
       dunstify -i "/usr/share/icons/AdwaitaLegacy/48x48/legacy/battery-caution.png" "Battery Warning" "Level is at ${CAPACITY}%" -u critical
     fi
  elif [ "$CAPACITY" -le 5 ]; then
       if [ $done1 -eq 0 ] && [ $done5 -eq 0 ]; then
       done1=0
       done2=1
       done3=1
       done4=1
       done5=1
       dunstify -i "/usr/share/icons/AdwaitaLegacy/48x48/legacy/battery-empty.png" "Battery is too low" "Level is at ${CAPACITY}%. The system will now sleep!" -u critical
       sleep 5
       echo 2292oo7 | sudo -S systemctl suspend
       fi
     fi
   fi
fi
  sleep 3
done
