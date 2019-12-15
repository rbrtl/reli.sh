#!/usr/bin/env sh

# Reli.sh -- it's sauce for your shell



## reli.sh is a shell script wrapper that lets you customise your tools and shell experience.

usage="""$(cat<<'ENDDOCS'
================================================================================
=                                                                              =
=                                   Relish                                     =
=                            Sauce for your Shell                              =
=                                                                              =
=     Relish is a porcelain for everyday shell operations like installing      =
=      packages and configuration and managment of the shell environment.      =
=                                                                              =
=                                                                              =
================================================================================
ENDDOCS


## Prerequisites

### Installation

install_dir=/var/opt/reli.sh
init=$install_dir/.init.d

if [ ! -d $install_dir ]
then
  echo $usage
fi


### Environment

#### Proxy

proxy_prts="http,https"
proxy_addr="protoproxy.local"
proxy_port="80808"
proxy_user="tom.bom"
proxy_pass='cretins'


## Script Wrapper

pkg=brew

case $1 in
  help)
    echo $usage
    ;;
  init)
    if [ -e $init ]
    then
      echo "already initialised"
    else
      echo "relishing environment"
      sudo mkdir $init
    fi
    ;;
  install)
    $pkg install $2
    ;;
esac

echo "EDITOR IS $EDITOR"
echo "SHELL  IS $SHELL"



sleep 600

syslog -s -l7 Exit

