alias ls="ls -GFh"
alias la="ls -a"
alias ll="ls -l"

hist() {
  history | sed 's/^[[:space:]]*[0-9]*[[:space:]]*//' | sort | uniq -c | sort -n
}

myfind() {
    find ./ -name "*$2*" -type "$1" | tee ${TMPDIR}/my_ffound | cat -n
    FFOUND_PWD=${PWD}
    FFOUND=($(cat ${TMPDIR}/my_ffound))
}
lf() { echo ${FFOUND[*]} | tr -s ' ' '\n' | cat -n; }
fn() {
  [ ! -z ${FFOUND[$1-1]} ] && echo ${FFOUND_PWD}/${FFOUND[$1-1]};
}
v() { vim $(fn "$1"); }
c() { cd $(dirname $(fn "$1")); }

ff() { myfind "f" "$1"; }
fd() { myfind "d" "$1"; }

vgr() { tmp=$(egrep -Rl "$1" * | xargs ) && vim -c ":vimgrep /$1/ ${tmp} | :copen "; }

