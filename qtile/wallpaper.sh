#!/bin/bash

#By Troyyy

wallpaper_dir="$(ls ~/Pictures/wallpaper)"
wallpaper="$HOME/.cache/currentwallpaper.png"

# Show the menu using Rofi

SelectWallpaper() {
    chosen=$(echo -e "$wallpaper_dir" | rofi -dmenu -i -p "Choose a wallpaper:3" -l 17 )
}

RandomWallpaper() {
    chosen=$(echo "$wallpaper_dir" | shuf -n 1 )
}


main() {
    notify-send "setting the wallpaper"
    if [[ -z "$chosen" ]]; then
	    notify-send "you didn't pick any wallpaper"
	    return 1
    else
	    waypaper --wallpaper -- "$path"  &
	    wal -i "$HOME/Pictures/wallpaper/$chosen" --cols16 darken -n
		qtile cmd-obj -o cmd -f reload_config
		swaync-client -rs &
	    cp "$HOME/Pictures/wallpaper/$chosen" "$wallpaper"
fi
}

if [[ -n $* ]]; then
	RandomWallpaper
    path="$HOME/Pictures/wallpaper/$chosen"

	main
else
	SelectWallpaper
    path="$HOME/Pictures/wallpaper/$chosen"

	main
fi

