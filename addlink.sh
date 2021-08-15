#!/usr/bin/env bash

read -p "xxx: " link
title=$(curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" $link | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')
# echo $title
git pull
{
    echo "<a href="
    echo $link
    echo ">"$title
    echo "</a> <br>"
    echo
} >> lists.html
git add lists.html
git commit -m "add links"
git push
