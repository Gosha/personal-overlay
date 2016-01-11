# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit git-r3 vala

DESCRIPTION="the terminal image viewer"
HOMEPAGE="https://github.com/radare/${PN}"
EGIT_REPO_URI="${HOMEPAGE}"

# Some weird personal license
LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

# USEFLAGS = x11-libs/gdk-pixbuf jpeg
IUSE=vala
DEPEND="x11-libs/gdk-pixbuf[jpeg] vala? ( dev-lang/vala )"
elog "$DEPEND"
RDEPEND="${DEPEND}"

src_compile(){
    emake VALAC="$(type -P valac-$(vala_best_api_version))"
}

src_install() {
    # Something is weird
    #emake DESTDIR="${D}" install
    dobin tiv
    dobin stiv-jpeg
}
