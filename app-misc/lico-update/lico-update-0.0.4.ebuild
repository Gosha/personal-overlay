# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="This is the official machine update script for the New Linux Counter Project (linuxcounter.net)"
HOMEPAGE="https://github.com/christinloehner/linuxcounter-update-examples"
EGIT_REPO_URI="https://github.com/christinloehner/linuxcounter-update-examples.git"
EGIT_COMMIT="6cd6ff27256c21d31827440c9df74b4f3237e519"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tor"

DEPEND=""
RDEPEND="net-misc/curl
	|| ( sys-apps/coreutils sys-apps/busybox )
	tor? ( net-proxy/torsocks )
	${DEPEND}"

src_prepare() {
	use tor || epatch "${FILESDIR}/${P}-no-torsocks.patch"
}

src_install() {
	dobin _official/lico-update.sh
}
