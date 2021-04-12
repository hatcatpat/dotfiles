import subprocess
import math
from datetime import date, datetime

def bat():
    s = ''
    s += '<separator label="battery"/> \n'
    status = subprocess.check_output(['cat', '/sys/class/power_supply/BAT0/status']).decode('ascii').replace("\n","").lower()
    if status == "unknown":
        status = "full"
    s += f'<item label="status: {status}" /> \n'

    battery = subprocess.check_output(['cat', '/sys/class/power_supply/BAT0/capacity']).decode('ascii').replace("\n","").lower()
    s += f'<item label="percent: {battery}" /> \n'
    return s

def wifi():
    s = ''
    command = subprocess.check_output(['iwgetid', '-r']).decode('ascii').replace("\n","").lower()
    s += '<separator label="wifi"/> \n'
    s += f'<item label="name: {command} "> \n'
    s += '\t<action name="Execute"> \n'
    s += '\t\t<command>networkmanager_dmenu</command>'
    s += '\t</action>'
    s += '</item>'

    quality = subprocess.check_output(['iwconfig','wlp3s0']).decode('ascii').lower()
    index = quality.find("link quality")
    x = quality[index+len("link quality="):]
    index = quality.find("signal level")
    x = x[:5]
    x = x.replace(" ","")
    x = x.split("/")
    perc = math.floor( (float(x[0])/float(x[1]))*100)
    s += f'<item label="percent: {perc}" /> \n'
    return s

def wm():
    s = ''
    s += '<separator label="wm"/> \n'
    desktop = subprocess.check_output(['xprop','-root','-notype','_NET_CURRENT_DESKTOP']).decode('ascii').replace("\n","").lower()
    desktop = desktop.replace('_net_current_desktop = ','')
    desktop = int(desktop)+1
    s += f'<item label="desktop: {desktop}" /> \n'

    # windows = subprocess.check_output([
        # 'wmctrl','-l'
    # ]).decode('ascii').split("\n")
    # windows = remove_values_from_list(windows, "")

    # application_ids = []
    # for w in windows:
        # application_ids.append( w.split(" ")[0] )

    # computer_name = "pat-thinkpad "
    # for i in range(len(windows)):
        # w = windows[i]
        # w = w[w.find(computer_name)-2:]
        # w = w.replace("pat-thinkpad ","")
        # s += f'<item label="{w}"> \n'
        # s += '\t<action name="Execute"> \n'
        # s += f'\t\t<command>wmctrl -i -a {application_ids[i]}</command>'
        # s += '\t</action>'
        # s += '</item>'
    return s

def cal():
    s = '<separator label="date" /> \n'
    d = date.today().strftime(f"%a %d %b").lower()
    s += f'<item label="{d}" /> \n'
    n = datetime.now().strftime("%I:%M %p").lower()
    s += f'<item label="{n}" /> \n'
    return s

def caps():
    xset = subprocess.check_output(['xset q | grep LED'], shell=True).decode('utf-8')

    capslock = ""
    if xset[65] == '0':
        capslock = "off"
    elif xset[65] == '1':
        capslock = "on"
    s = f'<separator label="caps is {capslock}" /> \n'
    return s


def remove_values_from_list(the_list, val):
   return [value for value in the_list if value != val]

def main():
    final_string = '<?xml version="1.0" encoding="UTF-8"?> \n'
    final_string += '<openbox_pipe_menu> \n'

    final_string += cal()
    final_string += wm()
    final_string += bat()
    final_string += caps()
    # final_string += wifi()

    final_string += '</openbox_pipe_menu> \n'

    print(final_string)

if __name__ == "__main__":
    main()
