#!/bin/bash -
#
#2016年 03月 20日 星期日 11:27:47 CST

result=$(grep 'snippet' snippets/html.snippets | awk '{print $2}' | sort)

#如果不相同, 相同返回码是0
if ! diff -q -L dictionary.new <(echo "${result}") dictionary
then
    read -p "override? [Enter] " answer
    test "$answer" || echo "${result}" > dictionary
fi

