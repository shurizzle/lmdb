</$objtype/mkfile

OLDCFLAGS=$CFLAGS

<npe/libnpe/mkfile

LIB=../libnpe.a
CFLAGS=$OLDCFLAGS -p -I./npe/include/npe -D__plan9__ -D__${objtype}__

HFILES=${HFILES:%=npe/libnpe/%}

OFILES=${OFILES:%=npe/libnpe/%}

CLEANFILES=$CLEANFILES $LIB

UPDATE=\
	libnpe.mk\
	npe/libnpe/mkfile\
	${OFILES:%.$O=%.c}\

%.$O: %.c
	$CC $CFLAGS -o $stem.$O $stem.c

compile:V: $LIB

$LIB: $OFILES
	ar vu $LIB $OFILES

clean:V:
	rm -f npe/libnpe/*.[05678qvt] npe/libnpe/[05678qvt].out $CLEANFILES
