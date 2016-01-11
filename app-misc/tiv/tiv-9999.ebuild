# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit git-r3 vala

DESCRIPTION="the terminal image viewer"
HOMEPAGE="https://github.com/radare/${PN}"
EGIT_REPO_URI="${HOMEPAGE}"

# Some weird personal license
LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

IUSE="vala"
DEPEND="vala? ( dev-lang/vala x11-libs/gdk-pixbuf[jpeg] ) virtual/jpeg"
RDEPEND="${DEPEND}"

src_compile(){
    if use vala; then
        emake VALAC="$(type -P valac-$(vala_best_api_version))"
    else
        emake stiv-jpeg
    fi
}

src_install() {
    # Something is weird
    #emake DESTDIR="${D}" install
    if use vala; then
        dobin tiv
    fi
    dobin stiv-jpeg
}
