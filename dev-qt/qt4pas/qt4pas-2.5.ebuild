# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="The Free Pascal Qt4 binding allows Free Pascal to interface with the C++ Library Qt."
SRC_URI="http://users.telenet.be/Jan.Van.hijfte/qtforfpc/V2.5/${PN}-V${PV}_Qt4.5.3.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-qt/qtcore-4.5.3:4
	>=dev-qt/qtgui-4.5.3:4
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-V${PV}_Qt4.5.3"

src_prepare() {
	qmake
	epatch "${FILESDIR}/${P}-Makefile.patch"
}

src_compile() {
	emake  || die "Make failed"

}
src_install() {
	emake INSTALL_ROOT="${D}" install || die
}
