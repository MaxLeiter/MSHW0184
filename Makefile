obj-m := MSHW0184.o

KDIR  := /lib/modules/$(shell uname -r)/build
PWD   := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	../linux/scripts/sign-file sha256 ../MOK.priv ../MOK.der MSHW0184.ko

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
