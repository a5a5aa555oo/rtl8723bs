### RTL8723BS Driver for Linux

Backporting the RTL8723BS driver to the old kernels from the linux git tree.

### How To Use

1. Install gcc, make, linux-headers and other packages required to build this driver

2. Build and install the driver

   (In a traditional way)

	$ make clean modules && sudo make install

	(In a DKMS way)

	$ sudo dkms install $PWD

3. Load the driver

   $ sudo modprobe r8723bs_git

### Note

Supported linux kernel version: 5.4.x ~ 6.3.x

Tested on the following linux distros and it works fine.

Debian 11.6 (kernel version: 5.10.0-21-amd64)

Ubuntu 20.04 (kernel version: 5.4.0-147-generic)

### WARNING

No warranty, use at your own risk.
