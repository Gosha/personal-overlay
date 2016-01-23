# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Tiny, Dirty, Linux-Only C command that looks for coreutils
basic commands (cp, mv, dd, tar, gzip/gunzip, cat, etc.) currently
running on your system and displays the percentage of copied data."
HOMEPAGE="https://github.com/Xfennec/${PN}"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
