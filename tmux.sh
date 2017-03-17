yum install -y gcc make kernel-devel make ncurses-devel

curl -O http://23.106.147.189/libevent-2.0.22-stable.tar.gz
tar xf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure --prefix=/tmp/libevent
make && make install
cp /tmp/libevent/lib/libevent-2.0.so.5 /usr/lib64
cd ..

curl -O http://23.106.147.189/tmux-2.3.tar.gz
tar xf tmux-2.3.tar.gz
cd tmux-2.3
CFLAGS="-I/tmp/libevent/include" LDFLAGS="-L/tmp/libevent/lib" ./configure --prefix=/usr/local/tmux
make && make install

touch /etc/profile.d/tmux.sh
echo 'export PATH=/usr/local/tmux/bin:$PATH'>/etc/profile.d/tmux.sh
. /etc/profile.d/tmux.sh
tmux -V
