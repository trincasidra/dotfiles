#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cursebreaker='python3 ~/CurseBreaker/CurseBreaker.py'
PS1='[\u@\h \W]\$ '
export VISUAL=nvim;
export EDITOR=nvim;
export TERM=kitty;
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json;
export GTK_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export CURSEBREAKER_PATH=~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/;
eval "$(starship init bash)"
