### Linux Driver for RTL8723BS

Backporting the RTL8723BS driver to the old kernels from the linux git tree.

### How to use

1. make && sudo make install
2. sudo sh -c "echo blacklist r8723bs > /etc/modprobe.d/blacklist-r8723bs.conf"

### Note

I tested on Debian 11.6 (kernel version: 5.10.0-21-amd64) and it works fine.

### WARNING

No warranty, use at your own risk.
