# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit toolchain-funcs eutils

RESTRICT="primaryuri"

DESCRIPTION="Plugin adds toolbar and status bar to Pidgin buddy list"
HOMEPAGE="http://vayurik.ru/wordpress/en/toobars"
SRC_URI="http://vayurik.ru/wordpress/wp-content/uploads/toobars/${PV}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin[gtk]"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}/po_makefile.patch"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README AUTHORS VERSION
}

pkg_postinst() {
	elog "Please note that the MyStatusBar (in purple-plugin_pack) conflicts"
	elog " with TooBars and you should only turn one on at a time."
}
