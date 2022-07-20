# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools xdg

DESCRIPTION="A handy personal organizer"
HOMEPAGE="http://osmo-pim.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}-pim/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+contacts +tasks +notes backup debug"
RESTRICT="mirror"

RDEPEND=">=x11-libs/gtk+-3.10:3
	dev-libs/libxml2:2
	>=dev-libs/libical-1.0:0
	>=app-text/gspell-1.2.0:0
	contacts? (
		>=net-libs/webkit-gtk-2.8.0:4
	)
	backup? (
		>=app-arch/libarchive-3.0.0
		app-office/gringotts
	)
	>=x11-libs/libnotify-0.7"
DEPEND="${RDEPEND}
	sys-devel/automake:1.15
	virtual/pkgconfig"
# need check if exact automake:1.15 slot really necessary

DOCS=( AUTHORS ChangeLog FAQ README TRANSLATORS )

PATCHES=( "${FILESDIR}/${PN}-0.4.2-fix-configure.patch" )

src_prepare() {
	xdg_src_prepare
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		--enable-backup=$(usex backup) \
		--with-notes=$(usex notes)       \
		--with-tasks=$(usex tasks)       \
		--with-contacts=$(usex contacts) \
		--enable-printing=yes            \
		--enable-debug=$(usex debug)
}
