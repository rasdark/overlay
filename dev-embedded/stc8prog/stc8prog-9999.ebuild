# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Command line flash programming tool for STC 8051 series microcontrollers"
HOMEPAGE="https://github.com/IOsetting/stc8prog"
EGIT_REPO_URI="https://github.com/IOsetting/stc8prog.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	default
	tc-export CC
}

src_install() {
	dobin ${PN}
}
