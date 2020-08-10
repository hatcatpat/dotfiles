import subprocess

s = '<?xml version="1.0" encoding="UTF-8"?> \n'
s += '<openbox_pipe_menu> \n'
s += '<separator label="wifi" /> \n'

nm = subprocess.check_output(['nmcli -t device wifi list'], shell=True).decode('utf-8').split("\n")
found = False
current_wifi = "none"
addresses = []

for l in nm:
    if len(l) > 0:
        address = l.split(":")[7]
        if l[0] == "*":
            found = True
            current_wifi = address
        if len(address) > 0:
            addresses.append(address)

s += f'<item label="connected: {current_wifi}" /> \n'
s += '<menu id="wifi-config" label="connect"> \n'
s += '<separator label="connect" /> \n'

s += '<item label="manage connections">'
s += '\t<action name="Execute">'
s += '\t\t<command>nm-connection-editor</command>'
s += '\t</action>'
s += '</item>'

for a in addresses:
    s += f'<item label="{a}"> \n'
    s += '\t<action name="Execute"> \n'
    s += f'\t\t<command>nmcli device wifi connect {a}</command>'
    s += '\t</action>'
    s += '</item>'

s += '</menu> \n'

s += '</openbox_pipe_menu> \n'
print(s)
