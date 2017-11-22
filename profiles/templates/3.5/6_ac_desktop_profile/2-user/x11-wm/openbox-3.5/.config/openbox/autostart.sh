# Calculate chmod=0755
#!/bin/bash

#?pkg(x11-misc/tint2)!=#
tint2 &
tint2 -c ~/.config/tint2/tint2rc.launcher &
#pkg#
#?pkg(x11-misc/gxkb)!=#
gxkb &
#pkg#
#?pkg(x11-misc/pcmanfm)!=#
pcmanfm --desktop &
#pkg#
