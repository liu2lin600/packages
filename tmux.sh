# 依赖包安装
yum install -y gcc make kernel-devel make ncurses-devel

# lib
curl -O http://23.106.147.189/libevent-2.0.22-stable.tar.gz
tar xf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure --prefix=/tmp/libevent
make && make install
cp /tmp/libevent/lib/libevent-2.0.so.5 /usr/lib64
cd ..

# tmux
curl -O http://23.106.147.189/tmux-2.3.tar.gz
tar xf tmux-2.3.tar.gz
cd tmux-2.3
CFLAGS="-I/tmp/libevent/include" LDFLAGS="-L/tmp/libevent/lib" ./configure --prefix=/usr/local/tmux
make && make install

# 环境变量
ln -s /usr/local/tmux/bin/tmux /usr/bin/
tmux -V

# 配置
cd
yum install -y git
git clone https://github.com/liu2lin600/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
