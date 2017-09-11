#/bin/bash

SEARCH=proxy.cc.yamaguchi-u

# git
TARGET=~/.gitconfig
[ ! -f ${TARGET} ] && touch ${TARGET}

cat << EOF >> ${TARGET}
[http]
       proxy = http://proxy.cc.yamaguchi-u.ac.jp:8080
[https]
       proxy = http://proxy.cc.yamaguchi-u.ac.jp:8080
EOF