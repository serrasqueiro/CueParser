#!/bin/sh
#	(c)2020 Henrique Moreira

# Commands to do when you reach here

synch_upstream ()
{
 # git remote add upstream git@github.com:artur-shaik/CueParser.git
 git fetch upstream
 return $?
}


wot_gorilla ()
{
 local WHERE=$1
 git remote -v | grep ^"${WHERE}.git@" | grep fetch.$ | awk '{print $2}'
}


echo "GIT origin is: $(wot_gorilla origin)"
UPSTR=$(wot_gorilla upstream)
if [ "$UPSTR" ]; then
	echo "Upstream (https://github.com/artur-shaik/CueParser) origin is: $UPSTR"
	echo
	echo "Synchronizing with upstream repo..."
	synch_upstream
	RES=$?
else
	echo "Consider doing
	git remote add upstream git@github.com:artur-shaik/CueParser.git
"
fi

# Exit status
exit $RES
