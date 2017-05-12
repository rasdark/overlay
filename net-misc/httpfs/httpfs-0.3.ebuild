# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit eutils
DESCRIPTION="Remote FUSE filesystem via server-side script"
HOMEPAGE="https://github.com/cyrus-and/httpfs"
SRC_URI="https://github.com/cyrus-and/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="
	app-editors/vim
	"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"


