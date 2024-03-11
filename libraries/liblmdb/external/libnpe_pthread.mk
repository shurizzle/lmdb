</$objtype/mkfile

OLDCFLAGS=$CFLAGS

<npe/libnpe_pthread/mkfile

LIB=../libnpe_pthread.a
CFLAGS=$OLDCFLAGS -p -I./npe/include/npe -D__plan9__ -D__${objtype}__

HFILES=${HFILES:%=npe/libnpe_pthread/%}

OFILES=${OFILES:%=npe/libnpe_pthread/%}

CLEANFILES=$CLEANFILES $LIB

UPDATE=\
	libnpe.mk\
	npe/libnpe_pthread/mkfile\
	${OFILES:%.$O=%.c}\

%.$O: %.c
	$CC $CFLAGS -o $stem.$O $stem.c

compile:V: $LIB

$LIB: $OFILES
	ar vu $LIB $OFILES

clean:V:
	rm -f npe/libnpe_pthread/*.[05678qvt] npe/libnpe_pthread/[05678qvt].out $CLEANFILES
