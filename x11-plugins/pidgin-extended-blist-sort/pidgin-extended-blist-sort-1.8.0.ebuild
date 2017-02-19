# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Pidgin plugin that provides several new sort options for the buddy list"
HOMEPAGE="http://freakazoid.teamblind.de/2008/12/13/pidgin-extended-buddy-list-sort-plugin/"
SRC_URI="https://launchpad.net/pidgin-extended-blist-sort/trunk/1.8/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README
}
