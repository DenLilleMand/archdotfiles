So using the configuration in eduroam.default.conf, then i would maybe put it inside of /etc/wpa\_supplicant/wpa\_supplicant.conf

Then make sure that the ip links are down e.g.
sudo ip link set wlp3s0 down
sudo ip link set enp0s25 down

That means you can restart the netctl-auto service through systemctl, if you try to restart it before 
you put the links down it will say that the links allready exist.

The wpa\_supplicant service doesn't nessecerily close itself down, so make sure that you:

```
ps aux | grep wpa_supplicant
```

```
kill -9 <wpa_supplicant process>
```

After you start the wpa\_supplicant on a specific interface(e.g. wlp3s0) with:

```
sudo wpa_supplicant -i wlp3s0 -cconfig /etc/wpa_supplicant/wpa_supplicant.conf 
```

It might be running with success in the authentication, if it is not a success you will want to make sure that 
you're executing it with "sudo" because the ap scan might need sudo privileges to scan.


