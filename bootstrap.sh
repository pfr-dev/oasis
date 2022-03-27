#!/bin/sh

set -eu -o

doas env groupsprog='id -Gn' FGREP='/bin/grep -F' EGREP='/bin/grep -E' TOUCH_FLAGS= \
	./bootstrap/bootstrap --prefix /pkg --prefer-pkgsrc yes --mk-fragment - <<EOF
MACHINE_GNU_PLATFORM=	x86_64-unknown-linux-musl
BUILDLINK_TRANSFORM+=	rm:-lbsd
COMPILER_INCLUDE_DIRS=	/include
LIBABISUFFIX=
ROOT_CMD=		doas sh -c
TOOLS_PLATFORM.bash=
TOOLS_PLATFORM.lex=	/bin/lex
TOOLS_PLATFORM.flex=	/bin/flex
TOOLS_PLATFORM.gm4=
TOOLS_PLATFORM.gsed=
TOOLS_PLATFORM.m4=	/bin/m4
TOOLS_PLATFORM.ninja=	/bin/samu
TOOLS_PLATFORM.patch=	/bin/patch
TOOLS_PLATFORM.pax=	/bin/pax
TOOLS_PLATFORM.sed=	/bin/sed
TOUCH_FLAGS=
EOF
