#!bin/bash
doas sh scripts/enable_multilib.sh
sh scripts/install_packages.sh
sh scripts/install_paru.sh
sh scripts/install_aur_packages.sh
