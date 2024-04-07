# install JDK (press enter 2 times).

sudo add-apt-repository ppa:openjdk-r/ppa -y

# update all packages.

sudo apt-get update

# install more packages.

sudo apt install openssh-server screen python3 git default-jdk android-tools-adb bc bison \
build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses-dev \
lib32readline-dev lib32z1-dev  liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev \
libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev \
libtinfo5 libncurses5 -y

# installing repo

mkdir ~/bin

PATH=~/bin:$PATH

cd ~/bin

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

# setup android build env

git clone https://github.com/kibria5/scripts.git scripts

cd scripts

bash setup/android_build_env.sh

# installing python

wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
sudo tar xzf Python-2.7.18.tgz
cd Python-2.7.18
sudo ./configure --enable-optimizations
sudo make altinstall
cd 
sudo ln -sfn '/usr/local/bin/python2.7' '/usr/bin/python2'

