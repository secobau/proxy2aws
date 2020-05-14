#!/bin/bash -x
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
export debug=$debug							;
export stack=$stack							;
#########################################################################
set +x && test "$debug" = true && set -x 				;
#########################################################################
pwd=$( dirname $( readlink -f $0 ) ) 					;
#########################################################################
domain=raw.githubusercontent.com                                        ;
#########################################################################
file=functions.sh                                                       ;
path=secobau/docker/master/AWS/common					;
curl -O https://$domain/$path/$file                                     ;
source ./$file                                                          ;
rm --force ./$file							;
#########################################################################
file=remove-config.sh                                                   ;
path=secobau/proxy2aws/master/Shell					;
targets=" InstanceManager1 " 						;
exec_remote_file_targets $domain $file $path $stack "$targets"		;
#########################################################################