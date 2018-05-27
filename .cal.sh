#!/bin/bash

while read -ra Z; do
	if [[ "${Z[@]}" == \*\ * ]]; then
		gbranch="${Z[1]}"
		break
	fi
done <<< "$(/usr/bin/git branch 2> /dev/null)"

((cno=0))
while read -r Z; do
	[[ "$Z" == commit* ]] && ((cno+=1))
done <<< "$(/usr/bin/git log 2> /dev/null)"

echo -ne "$(git diff --cached --name-only | wc -l)"\
	"$(git diff --stat origin/master.. | wc -l)"\
	"$(git diff --name-status | wc -l)"\
	"$(git ls-files --others --exclude-standard | wc -l)"\
	"$gbranch"\
	"${cno}"\

git rev-list --left-right --count origin/master..."$gbranch" >/dev/null 2>&1
if [ "$?" == 0 ];then
	rev=`git rev-list --left-right --count origin/master..."$gbranch"`;
	echo -e "$(cut -f1 <<< $rev )" "$(cut -f2 <<< $rev )"
else
	echo -e "-1" "-1"
fi
