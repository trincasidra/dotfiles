alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cursebreaker='python3 ~/CurseBreaker/CurseBreaker.py'
alias sudo='doas'
alias sudoedit='doas rnano'
alias git='LANG=en_GB git'
alias vi='nvim'
alias vim='nvim'
alias emacs='nvim'
alias subl='nvim'
alias nano='nvim'
alias hx='nvim'
alias excel='sc-im'
alias word='wordgrinder'
alias jira='fjira --project=SF'
alias jira-sf='fjira --project=SF'
alias tickets='fjira --project=HI'
alias jira-hi='fjira --project=HI'
alias lspackages='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)'

sfck() {
  sf config set target-org="$1"
}
