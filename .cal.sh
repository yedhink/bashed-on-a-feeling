#!/usr/bin/env bash

git=`whereis git | cut -d " " -f2` 
while read -ra Z; do
	if [[ "${Z[@]}" == \*\ * ]]; then
		gbranch="${Z[1]}"
		break
	fi
done <<< "$($git branch 2> /dev/null)"

((cno=0))
while read -r Z; do
	[[ "$Z" == commit* ]] && ((cno+=1))
done <<< "$($git log 2> /dev/null)"

$git rev-list --left-right --count origin/master..."$gbranch" >/dev/null 2>&1
if [ "$?" == 0 ];then
	rev=`$git rev-list --left-right --count origin/master..."$gbranch"`;
	beh=$(cut -f1 <<< $rev )
	ahe=$(cut -f2 <<< $rev )
else
	beh="-1"
	ahe="-1"
fi

echo -e "$($git diff --cached --name-only | wc -l)"\
	"$($git diff --stat origin/master.. | wc -l)"\
	"$($git diff --name-status | wc -l)"\
	"$($git ls-files --others --exclude-standard | wc -l)"\
	"$gbranch"\
	"${cno}"\
	"$beh"\
	"$ahe"
