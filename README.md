# CoreTempCheck
A CPU Core Temperature Checker I made using bash.

This basically uses the sensors command in repetition and provides the readings in a nice way. It also writes the output (for critical tempertatures) to temps.log.

You can set the critical (line 41), High (line 50), moderate (line 53) temperatures as per need in temps.sh.

It also provides a notification using notify-send in case of critical temperature
