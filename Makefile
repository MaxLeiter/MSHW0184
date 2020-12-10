obj-m := MSHW0184.o

KDIR  := /lib/modules/$(shell uname -r)/build
PWD   := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	../linux/scripts/sign-file sha256 ../MOK.priv ../MOK.der MSHW0184.ko

patch:
	diff -Naur apds9960.c MSHW0184.c > diff.patch; [ $$? -eq 1 ]
	
clean:
	rm patch
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
