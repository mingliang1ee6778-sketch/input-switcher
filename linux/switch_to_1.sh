#!/bin/bash

# === Pop Icon Key via Bolt Receiver ===
# PID C548 = Logitech Bolt receiver
# INDEX: 0x01 if keyboard was paired first, 0x02 if second — check via Wireshark/Solaar
# COMMAND: feature+function index for CHANGE_HOST — verify via Wireshark/Solaar
# CHANNEL: 0x00=ch1, 0x01=ch2, 0x02=ch3
KB_PID="C548"
KB_USAGE_PAGE="0xFF00"
KB_USAGE="0x0001"
KB_INDEX="0x01"
KB_COMMAND="0x0A,0x1E"
KB_CHANNEL="0x00"

# Switch Pop Icon Key to channel 1
hidapitester --vidpid 046D:${KB_PID} --usagePage ${KB_USAGE_PAGE} --usage ${KB_USAGE} --open --length 20 --send-output 0x11,${KB_INDEX},${KB_COMMAND},${KB_CHANNEL}

# === M750L via Bolt Receiver ===
# INDEX: 0x02 if mouse was paired second, 0x01 if first — check via Wireshark/Solaar
# COMMAND: feature+function index for CHANGE_HOST — verify via Wireshark/Solaar
MS_PID="C548"
MS_USAGE_PAGE="0xFF00"
MS_USAGE="0x0001"
MS_INDEX="0x03"
MS_COMMAND="0x0A,0x1E"
MS_CHANNEL="0x00"

# Switch M750L to channel 1
hidapitester --vidpid 046D:${MS_PID} --usagePage ${MS_USAGE_PAGE} --usage ${MS_USAGE} --open --length 20 --send-output 0x11,${MS_INDEX},${MS_COMMAND},${MS_CHANNEL}
