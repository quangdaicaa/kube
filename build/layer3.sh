cat > /etc/hostname << EOF
kube
EOF

cat > /etc/hosts << EOF
127.0.0.1   localhost
10.11.252.20    kube.origin.vm   kube
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
      addresses: [10.11.252.20/16]
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
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+HyQgi6qhRjxcKdbOKU1YkbGVLrNetWRO5uD5VnK/a0hSe05jHUISDGqVPMiPenJIg0HJ+bLAm+sXxc1tWYCPxV+onSp0oqY6cYg5I8jiCPYYK1vMSp/PlzDCLpMhluQo9zdRhDuVe+l790PtXcb/pofzM0oeuKD/Z2gKMAZGtSNphjFp/5KQypJPq8Nb3QMyVWKoryCrfovDQqO/gjJvwDUCusPjN5WlofUYkeqfYVe7jCfgVNPAC9e1z2nIevQ/btgoCQA0egqwOeCRorlxSl3cayOgiNN8juPuYD3NcK2KYujfSMeeIJXrkyX3UnVGQFSyFNwqi43dnFqCUgIWC41/i2c1+4GEbJsKnM2M8pU2XEksLheQTwoLiaxVXv3wZGJJpOR0mwe0cUaWCIIvvT2pBIqw2vd99/yxmAaxDTIUxcvTIgLwnbXXIa5Q1+lXmFDGtyDdFoUODErs9DfHNf9CNqtHuyOA1cww7Mlomt9urMwbpEwan/tOwxUxW4zBfLwmU2J9cteZG3xWMbm/CuVy5IlcPyZ/7Hliv56+5jxnQiKKMIce/U9vkgYr3a7jeHCrrkW+RdIcj6RqY/ylx5sde1bwfedlL//Wf0+D8i1Cdrb65JBu4tU6R/DxaVJmBZHbgrg4GBvw/FbL38o54NDNWt65bRExB1KeLilFZw== quang@home

EOF
chmod 600 /root/.ssh/authorized_keys


systemctl enable docker

systemctl enable kubelet

apt install -y kubectl
apt upgrade -y
apt autoremove -y
apt clean

echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> /etc/profile

rm -rf /tmp/*
dmesg --clear
history -c
reboot