#### Configure Desktop Launch
### Change xterm to startxfce4 if you have xfce4 installed
### Don't forget to add "> /dev/null 2>&1 &" at the end
### Otherwise. it will print terminal logs
export DISPLAY=:1 &&

### Launch Xterm
openbox > /dev/null 2>&1 &
