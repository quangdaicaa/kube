cat > /etc/hostname << EOF
ubuntu
EOF

cat > /etc/hosts << EOF
127.0.0.1   localhost
10.11.2.1    ubuntu.origin.vm   ubuntu
EOF

rm -rvf /etc/netplan
mkdir -pv /etc/netplan
cat > /etc/netplan/network.yaml << EOF
network:
  version: 2
  ethernets:
    ens32:
      dhcp4: no
      dhcp6: no
      addresses: [10.11.2.1/16]
      routes:
      - to: default
        via: 10.11.254.10
EOF

rm -rf /root/.ssh
mkdir /root/.ssh
chmod 700 /root
chmod 700 /root/.ssh
rm -f /root/.ssh/authorized_keys
cat > /root/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFL7Z9pAUrnWpbaC2EfFMCTrjLQN0fRlBo2M1dJ1/EP7/1Ds7WrheI94kt07q/eIwAEtvp0nvXCO5Jy/u28BXk6BGSKn3EVQM7mS5qlcwD61sVcq9+SemPGa2TlUBVjLQyvk+AXCzCD14Gmo5eXoEo3NMrXIIqfmPpVaJIYP9WZGBTKE880WIkAXjtSRN5UG3lQvuJ6wbvvgseM+Y2SjjxmKiDbCN/xR5XoswKFVGllNgHfKQHNlm4/qjgfTgQtmzNwmmUUNE5ZYFTLow3kUTshZPOZOOmMKKCKNioWJI0PEVzHsFDUAoeXiT0MblCO6jzODk8wjZW24eIoAxoRiuaXr4aPFuALNdBB1g1Lcg+fXFAtwK4K1zdb+XhloBbxtZFxEWB7DLU4czf2uYE7D3zmbeUpkbrZG9vXCx+SFLSCYIDMVvLbf1UpwS2LY5/9KfBprecz533PudqYvRp09BT+JH/xYZw33khyYNgxt74e75IaZUzHwnX2DE5uSXlXlM6CCqsxwDXNYX53DA/CIz3W0OIJBruavs5OGRWk19fDiAZVh9aOaZhQ0ub4/576voC0eusjtxmcYyKA7QknQCXy6eKW2B8u6STWY9Gn9TO516I1DS6+cExPr+lqmJx+tHfArBUMdahbmZcYVaHwXj6celuUAg+umZvV9e17A7Juw== quang@home

EOF
chmod 600 /root/.ssh/authorized_keys



cat > /etc/ssh/sshd_config << EOF
Include /etc/ssh/sshd_config.d/*.conf
KbdInteractiveAuthentication no
UsePAM yes
X11Forwarding yes
AcceptEnv LANG LC_*
Subsystem sftp	/usr/lib/openssh/sftp-server
PasswordAuthentication no
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
PrintMotd yes
Port 22
EOF


rm -f /etc/resolv.conf
cat > /etc/resolv.conf << EOF
nameserver 10.11.254.20
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF
chmod 444 /etc/resolv.conf


rm -fv /etc/apt/sources.list
rm -rfv /etc/apt/sources.list.d
mkdir -pv /etc/apt/sources.list.d/offical.d
mkdir -pv /etc/apt/sources.list.d/package.d
cat > /etc/apt/sources.list.d/offical.d/vn.list << EOF
deb http://vn.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://vn.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://vn.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://vn.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://mirrors.bkns.vn/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/sg.list << EOF
deb http://sg.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://sg.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://sg.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://sg.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb http://0ms.run/mirrors/mirror.enzu.com/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/us.list << EOF
deb http://us.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://mirror.enzu.com/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/th.list << EOF
deb http://th.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://th.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://th.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://th.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://mirror.kku.ac.th/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/cn.list << EOF
deb http://cn.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://mirror.nju.edu.cn/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/jp.list << EOF
deb http://jp.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://jp.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://jp.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://jp.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://linux.yz.yamagata-u.ac.jp/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/kr.list << EOF
deb http://kr.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://kr.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://kr.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://kr.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://mirror.kakao.com/ubuntu/ jammy main
EOF

cat > /etc/apt/sources.list.d/offical.d/de.list << EOF
deb http://de.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb https://ftp.uni-stuttgart.de/ubuntu/ jammy main
EOF


ln -s /etc/apt/sources.list.d/offical.d/vn.list /etc/apt/sources.list.d/offical.list
apt update


apt install -y \
  curl wget \
  apt-transport-https software-properties-common \
  gnupg2 ca-certificates lsb-release debian-archive-keyring


apt update
apt purge -y locales
apt install -y locales
locale-gen en_US.UTF-8 en_US
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


cat >> /etc/profile << EOF
export TZ=Asia/Ho_Chi_Minh
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
EOF
source /etc/profile


apt update
apt install -y \
  build-essential libpcap0.8 xsel openssh-server \
  git tree lunar htop net-tools iputils-ping

apt update
apt install -y busybox
busybox --install

apt update
apt install -y nano
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | bash
echo "set tabsize 2" >> /etc/nanorc

apt update
apt install -y ntpdate
rm -fv /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
ntpdate ntp.origin.vm

rm -rfv /usr/games
rm -rfv /usr/local/games
apt autoremove -y --purge snapd
apt-mark hold snapd


systemctl daemon-reload
systemctl disable ufw

apt upgrade -y
userdel -r lord
apt autoremove -y
apt clean         # /var/cache/apt/archives
rm -rf /tmp/*     # /tmp
dmesg --clear     # /var/log/journal
history -c        # /root/.bash_history
reboot