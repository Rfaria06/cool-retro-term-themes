#!/bin/bash
# /usr/lib/x86_64-linux-gnu/qt5/qml/QMLTermWidget/color-schemes

# Function to convert hex colors to rgb
hex2rgb() {
    hex=$(echo "${1^^}" | sed 's/#//g')

    a=$(echo $hex | cut -c-2)
    b=$(echo $hex | cut -c3-4)
    c=$(echo $hex | cut -c5-6)

    r=$(echo "ibase=16; $a" | bc)
    g=$(echo "ibase=16; $b" | bc)
    b=$(echo "ibase=16; $c" | bc)

    echo $r $g $b
}

# Get each line from wal color file and loop though
echo 'Getting generated wal colors...'

USER_HOME=$(eval echo ~${SUDO_USER})

IFS=$'\n' read -d '' -r -a colors < "${USER_HOME}/.cache/wal/colors"

color0=$(hex2rgb ${colors[0]})
color1=$(hex2rgb ${colors[1]})
color2=$(hex2rgb ${colors[2]})
color3=$(hex2rgb ${colors[3]})
color4=$(hex2rgb ${colors[4]})
color5=$(hex2rgb ${colors[5]})
color6=$(hex2rgb ${colors[6]})
color7=$(hex2rgb ${colors[7]})
color8=$(hex2rgb ${colors[8]})
color9=$(hex2rgb ${colors[9]})
color10=$(hex2rgb ${colors[10]})
color11=$(hex2rgb ${colors[11]})
color12=$(hex2rgb ${colors[12]})
color13=$(hex2rgb ${colors[13]})
color14=$(hex2rgb ${colors[14]})
color15=$(hex2rgb ${colors[15]})

echo 'Generating cool-retro-term colorscheme...'

# Title
echo "title White on Black" > cool-retro-term.schema

# Foreground color
echo "color 0 ${color15} 0 0" >> cool-retro-term.schema
# Foreground bold color
echo "color 10 ${color15} 0 1" >> cool-retro-term.schema

# Background color
echo "color 1 ${color0} 1 0" >> cool-retro-term.schema
# Background bold color
echo "color 11 ${color0} 1 0" >> cool-retro-term.schema

# Color Black
echo "color 2 ${color0} 0 0" >> cool-retro-term.schema
# Color Black Bold
echo "color 12 ${color8} 0 0" >> cool-retro-term.schema

# Color Red 
echo "color 3 ${color1} 0 0" >> cool-retro-term.schema
# Color Red Bold
echo "color 13 ${color9} 0 0" >> cool-retro-term.schema

# Color Green 
echo "color 4 ${color2} 0 0" >> cool-retro-term.schema
# Color Green Bold
echo "color 14 ${color10} 0 0" >> cool-retro-term.schema

# Color Yellow 
echo "color 5 ${color3} 0 0" >> cool-retro-term.schema
# Color Yellow Bold
echo "color 15 ${color11} 0 0" >> cool-retro-term.schema

# Color Blue 
echo "color 6 ${color4} 0 0" >> cool-retro-term.schema
# Color Blue Bold
echo "color 16 ${color12} 0 0" >> cool-retro-term.schema

# Color Magenta 
echo "color 7 ${color5} 0 0" >> cool-retro-term.schema
# Color Magenta Bold
echo "color 17 ${color13} 0 0" >> cool-retro-term.schema

# Color Cyan 
echo "color 8 ${color6} 0 0" >> cool-retro-term.schema
# Color Cyan Bold
echo "color 18 ${color14} 0 0" >> cool-retro-term.schema

# Color White 
echo "color 9 ${color7} 0 0" >> cool-retro-term.schema
# Color White Bold
echo "color 19 ${color15} 0 0" >> cool-retro-term.schema

echo 'Replacing the old colorscheme with the new...'
mv cool-retro-term.schema /usr/lib/x86_64-linux-gnu/qt5/qml/QMLTermWidget/color-schemes/cool-retro-term.schema

echo 'Done!'
