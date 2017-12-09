pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo 50%

pactl set-sink-mute 0 toggle

Had problems with third party input:
Install: alsa-utils
Run: systemctl start alsa-restore.service
Magic?


