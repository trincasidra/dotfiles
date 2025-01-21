#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
export VISUAL=nvim;
export EDITOR=nvim;
export TERM=kitty;
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json;
export GTK_IM_MODULE=fcitx;
export GLFW_IM_MODULE=ibus;
export QT_IM_MODULE=fcitx;
export XMODIFIERS=@im=fcitx;
export PATH=$PATH:$HOME/.local/bin;
eval "$(starship init bash)"
