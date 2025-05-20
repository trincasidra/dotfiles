#!bin/bash
doas sh scripts/enable_multilib.sh
echo "GPU brand?"
echo "  1) AMD Radeon"
echo "  2) Nvidia"
echo "  3) Intel"
echo ""
read n
case $n in
  1) sh scripts/install_radeon.sh;;
  2) sh scripts/install_nvidia.sh;;
  3) sh scripts/install_intel.sh;;
  *) echo "Invalid option, skipping...";;
esac
sh scripts/install_packages_base.sh
sh enable_services.sh
sh scripts/install_packages_home.sh
sh scripts/install_paru.sh
sh scripts/install_aur_packages_base.sh
sh scripts/install_aur_packages_home.sh
