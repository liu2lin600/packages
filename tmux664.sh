#!/bin/bash

# tmux2.3 on centos6.x86_64

pack='tmux-2.3-centos6.x86_64.tar.gz'
local='/usr/local/tmux'

curl -O 23.106.147.189/$pack
tar xf $pack -C /usr/local/
rm -f $pack
ln -s /usr/local/tmux/bin/tmux /usr/bin

cp $local/conf/tmux.conf ~/.tmux.conf
cp $local/conf/tmux.conf.local ~/.tmux.conf.local

cp $local/lib/libevent-2.0.so.5 /usr/lib64

tmux -V
