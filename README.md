# archdotfiles
Just dotfiles for arch

## "hard" to install
camelcase motion is kind of weird because it is distributed as a vimball from
the vim website and you have to open it with neovim or vim and it will be able
to deploy it self into the folders it needs to go, plugged/docs etc.
but it is really nice, so should install it again with a new distribution

## Fonts

Editor and terminal:

- Hack (I think that i currently just run with the normal hack
	font, but obviously sometimes i have installed a modified one
	that support special icons, not sure what i need after i
	uninstalled that extension to nerdtree with the icons)

Polybar needs:
- M+  (AUR: ttf-mplus)
- Font Awesome 5 (pacman: ttf-font-awesome)

Use the fc-list to see if the fonts is properly installed

## tips

Remember to add the .pgpass file and .vimrcpg

## Extra installed programs

- exa (modernised ls, written in Rust i think)
- pgcli
- zsh
- polybar
- WM: i3-gaps (in contrary to i3)
- neovim
- git
- vimium (chromium plugin)
- npm/node
- pip
- I guess i have some GTK themes installed, currently
    i am running with the theme Arc, with Adwaita icons
- Terminal font: Hack
- Terminal: Alacritty
- Notice the powerline plugin for zsh and the ZSH theme set
    as ZSH_THEME="powerline" in the .zshrc

## File system layout:
```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 167.7G  0 disk
├─sda1   8:1    0     1G  0 part /boot
├─sda2   8:2    0     6G  0 part [SWAP]
├─sda3   8:3    0    20G  0 part /
└─sda4   8:4    0 140.7G  0 part /home
```

Notice that i gave my Arch linux distro 20GB for the root
partition, i would say that i have been running with that for
a year and a half now, and i guess that means it is OK, but i
really have to cleanup especially Docker and pacman extremely often,
deleting packages i don't need anymore all the time e.g. if i have
a down time of FSharp at university, i just uninstall it for the extra
120MB. There is definitely no reason not to give your /root partition about 50GB, then you can do a cleanup once every other month. 

My paritioning scheme is GPT because i read that it was the new thing

Next time i format and install a linux distro again, i really want to use a sort of encryption of the harddesk, just to check it out. 
