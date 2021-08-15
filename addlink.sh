#!/usr/bin/env bash

read -p "xxx: " link
title=$(curl $link | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')
# echo $title
git pull
{
    echo "<a href="
    echo $link
    echo ">"$title
    echo "</a> <br>"
    echo
} >> lists.html
git push
