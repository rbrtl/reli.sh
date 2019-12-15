#!/bin/sh

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
)"""

INIT=.init/init.sh

$INIT

pkg=brew

case $1 in
help)
    echo "$usage"
;;
install)
    $pkg install $2
;;
*)
    $*
esac

syslog -s -l7 Exit

