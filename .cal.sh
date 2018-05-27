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

echo
echo -ne "$(git diff --cached --name-only | wc -l)  "
echo -ne "$(git diff --stat origin/master.. | wc -l) "
echo -ne "$(git diff --name-status | wc -l) "
echo -ne "$(git ls-files --others --exclude-standard | wc -l) "
echo -ne "$gbranch "
echo -ne "${cno} "

git rev-list --left-right --count origin/master..."$gbranch" >/dev/null 2>&1
if [ "$?" == 0 ];then
	rev=`git rev-list --left-right --count origin/master..."$gbranch"`;
	echo -ne "$(cut -f1 <<< $rev ) "
	echo -ne "$(cut -f2 <<< $rev ) "
else
	echo -ne "-1 " 
	echo -ne "-1 "
fi
echo
