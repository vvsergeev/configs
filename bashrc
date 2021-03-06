#colored simple bash prompt
#Edit MY-SRV and add it to your /etc/profile

echo MY-SRV > /etc/region
REGION=`cat /etc/region`
export REGION

if [[ $UID == 0 ]]
    then
    PS1="\[\033[00m\][\[\033[1;32m\]\$REGION\[\033[00m\]|\[\033[1;31m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w\[\033[00m\]]\[\033[1;31m\]#\$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]!\") \[\033[00m\]"
    else
    PS1="\[\033[00m\][\[\033[1;32m\]\$REGION\[\033[00m\]|\[\033[1;34m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;34m\]\w\[\033[00m\]]\[\033[1;34m\]$ \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]!\") \[\033[00m\]"
fi

#some nice functions thanks to Vasily Laur
# classic archive extractor
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via $0" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

pk() {
    if [ $2 ]; then
        case $1 in
            tbz)    tar cjvf "$2.tar.bz2" "$2"    ;;
            tgz)    tar czvf "$2.tar.gz"  "$2"    ;;
            tar)    tar cpvf "$2.tar"     "$2"    ;;
            bz2)    bzip "$2"                     ;;
            gz)     gzip -c -9 -n "$2" >  "$2.gz" ;;
            zip)    zip -r "$2.zip" "$2"          ;;
            7z)     7z a "$2".7z "$2"             ;;
            *)      echo "'$1' cannot be packed via $0" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# aliases
alias grep='grep --colour=auto'
alias cp='cp -r'
alias scp='scp -r'
alias rm='rm -r'
alias mkdir='mkdir -p'
alias ls='ls -F --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -l --color=auto -h'
alias lla='ll -A --color=auto -h'
which colordiff >/dev/null && alias diff='colordiff'
