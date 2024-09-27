if status is-interactive
    # Commands to run in interactive sessions can go here
end

function updmir
echo Simone | sudo -S reflector -c "DE" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
end

#function updkwin
#yay -S kwin-effects-forceblur --rebuild --noconfirm && yay -S kwin-effect-rounded-corners-git --rebuild --noconfirm
#end

function checkdiff
DIFFPROG=meld pacdiff -s
end

function news
w3m -4 https://archlinux.org/news
end

function archbtw
clear && fastfetch
end

function editfish
micro $HOME/.config/fish/config.fish
end

function sospendi
echo Simone | sudo -S systemctl suspend
end

function riavvia
echo Simone | sudo -S reboot now
end

function spegni
echo Simone | sudo -S shutdown now
end

function edithypr
micro $HOME/.config/hypr/hyprland.conf
end

function minifetch
clear && fastfetch -c $HOME/.config/fastfetch/config2.jsonc --colors-block-range-start 9 --colors-block-width 3
end

function exithypr
bash $HOME/exitleland.sh
end

set -Ux EDITOR micro
set -Ux VISUAL micro
