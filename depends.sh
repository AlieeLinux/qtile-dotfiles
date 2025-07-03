#!/bin/bash

depends=(eza qtile rofi wal)

noninstalled=()

[ -f /lib/python3.13/site-packages/qtile_extras/bar.py ] || yay -S qtile-extras

[ -f /bin/yay ] && echo "Yay installed"

for i in "${depends[@]}"; do
    if [ -f /bin/"$i" ]; then
        echo "$i exists"
    else
        noninstalled+=("$i")
    fi
done

yay -S --needed "${noninstalled[@]}" python-pywayland python-pywlroots python-dbus-fast noto-fonts noto-fonts-cjk ly fastfetch

read -r -p "Do you want to enable the ly display manager? (y/n):" p

case "$p" in
    y|Y)
        sudo systemctl enable ly
        ;;
esac

