#!/bin/sh
#
# Copyright by Arvydas Juskevicius. Agile Innovative Ltd 2014
# See LICENSE file for licensing details
#
# Shell script that configures mate-terminal 1.6.x to use solarized theme
# colors. Written for Mint 16.0, might work on other Linux OS using gsettings
# to store configuration
#
# Solarized theme: http://ethanschoonover.com/solarized
#
# Adapted from this source:
#
# https://gist.github.com/codeforkjeff/1397104

echo "Solarize Mate Terminal"
echo "Support URL: https://github.com/arvydas/mate-terminal-solarize/issues"
echo ""
echo "This script automatically sets solarized color palette to the Default Mate Terminal profile."
echo ""

case "$1" in
  "dark")
    PALETTE="#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
    BG_COLOR="#00002B2B3636"
    FG_COLOR="#65657B7B8383"
    ;;
  "light")
    PALETTE="#EEEEE8E8D5D5:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#070736364242:#FDFDF6F6E3E3:#CBCB4B4B1616:#9393A1A1A1A1:#838394949696:#65657B7B8383:#6C6C7171C4C4:#58586E6E7575:#00002B2B3636"
    BG_COLOR="#FDFDF6F6E3E3"
    FG_COLOR="#838394949696"
    ;;
  *)
    echo "Usage: solarize [light | dark]"
    exit
    ;;
esac

gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ background-color $BG_COLOR
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ foreground-color $FG_COLOR
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ palette $PALETTE

gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-theme-colors false
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ bold-color-same-as-fg false

echo ""
echo ""
echo "Settings applied."
echo ""
echo ""
echo "IMPORTANT: Please close and restart all Terminal windows for changes to take effect"
