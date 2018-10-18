#colored simple bash prompt
#Edit MY-SRV and add it to your /etc/profile

echo MY-SRV > /etc/region
REGION=$(cat /etc/region)
export REGION

if [[ $UID == 0 ]]
    then
    PS1="\[\033[00m\][\[\033[1;32m\]\$REGION\[\033[00m\]|\[\033[1;31m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w\[\033[00m\]]\[\033[1;31m\]# \[\033[00m\]"
    else
    PS1="\[\033[00m\][\[\033[1;32m\]\$REGION\[\033[00m\]|\[\033[1;34m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[1;37m\]:\[\033[1;34m\]\w\[\033[00m\]]\[\033[1;34m\]$ \[\033[00m\]"
fi
