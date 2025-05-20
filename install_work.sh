#!bin/bash
sh scripts/install_packages_base.sh
sh scripts/enable_services.sh
sh scripts/install_packages_work.sh
sh scripts/install_paru.sh
sh scripts/install_aur_packages_base.sh
sh scripts/install_aur_packages_work.sh
sh scripts/install_npm_packages_work.sh
