#!bin/bash
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
systemctl enable reflector.service
systemctl start reflector.service
