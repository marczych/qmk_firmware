#!/bin/bash

set -euo pipefail

echo Generating keymap.c
qmk json2c \
  -o keyboards/omkbd/ergodash/rev1/keymaps/marczych/keymap.c \
  keyboards/omkbd/ergodash/rev1/keymaps/marczych/marczych.json

echo Compiling firmware
qmk compile -kb omkbd/ergodash/rev1 -km marczych

cat <<EOF
Once you are ready:

1. Unplug the USB cable.
2. Unplug the TRRS cable.
3. Plug in the USB cable.

EOF

read -rp 'Then press enter: ' result

if [[ $result != '' ]]; then
  exit 1
fi

echo Flashing firmware \#1...
qmk flash omkbd_ergodash_rev1_default.hex

read -rp 'Swap keyboards then hit enter: ' result

if [[ $result != '' ]]; then
  exit 1
fi

echo Flashing firmware \#1...
qmk flash omkbd_ergodash_rev1_default.hex

cat <<'EOF'
Success!

Now:

1. Unplug the USB cable.
2. Plug in the TRRS cable.
3. Plug in the USB cable.
EOF
