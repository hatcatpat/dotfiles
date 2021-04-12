import subprocess

xset = subprocess.check_output(['xset q | grep LED'], shell=True).decode('utf-8')

capslock = ""

if xset[65] == '0':
    capslock = "off"
elif xset[65] == '1':
    capslock = "on"

subprocess.run([f'dunstify "caps is {capslock}" -r 4 -t 1000'], shell=True)
