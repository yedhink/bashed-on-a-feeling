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

rev=`git rev-list --left-right --count origin/master...master`;

echo -e "$(git diff --cached --name-only | wc -l)"
echo -e "$(git diff --stat origin/master.. | wc -l)"
echo -e "$(git diff --name-status | wc -l)"
echo -e "$(git ls-files --others --exclude-standard | wc -l)"
echo -e "$gbranch"
echo -e "${cno}"
echo -e `cut -f1 <<< $rev` 
echo -e `cut -f2 <<< $rev`
