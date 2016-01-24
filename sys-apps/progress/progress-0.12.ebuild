# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 toolchain-funcs

DESCRIPTION="show progress for cp, rm, dd, and so forth"
HOMEPAGE="https://github.com/Xfennec/${PN}"
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_COMMIT="b59ddfd5679488e774ef419148dd1d1694b757ae"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"

RDEPEND="sys-libs/ncurses"
DEPEND="
		${RDEPEND}
		virtual/pkgconfig
"

src_prepare() {
	sed -i \
		-e '/LDFLAGS/s:-lncurses:$(shell $(PKG_CONFIG) --libs ncurses):' \
		-e 's:CFLAGS=-g:CFLAGS+=:' \
		-e 's:gcc:$(CC):g' \
		Makefile || die
	tc-export CC PKG_CONFIG
}

src_install() {
	emake PREFIX="${D}/${EPREFIX}/usr" install
	dodoc README.md
}
