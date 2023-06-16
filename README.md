### Linux Kernel Module "r8723bs"

Driver for Realtek RTL8723BS wifi chip, which is backported from linux mainline

### How To Use

1. Install gcc, make, linux-headers and other packages required to build this driver

2. Build and install the driver

	* _In a traditional way_

	   `make clean modules && sudo make install`

	* _In a DKMS way_

	   `sudo dkms install $PWD`

3. Load the driver

   `sudo modprobe r8723bs_git`

### Note

Supported linux kernel version: 5.4.x ~ 6.4.x

Tested on the following linux distros and it works.

Debian 11.6 (kernel version: 5.10.0-23-amd64)

Ubuntu 20.04 (kernel version: 5.4.0-152-generic)

Thanks to all the maintainers of this kernel module!

### Known Issue

Disconnect randomly when using 40MHz channel width 

### WARNING

No warranty, use at your own risk.
