# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils gnome2-utils

MY_PN="KeePass"
MY_P="${MY_PN}-${PV}"
MY_DEV_VER=${PV##*.}
DESCRIPTION="KeePass is a free, open source, light-weight and easy-to-use password manager."
HOMEPAGE="http://keepass.info/"
# this is the mono-2.10 bugfix version...
SRC_URI="http://keepass.info/filepool/${MY_PN}_${MY_DEV_VER}_Unix.zip -> ${MY_P}.zip"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

LICENSE="GPL-2"

RDEPEND=">=dev-lang/mono-2.10"

#S="${WORKDIR}"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "${A}"
}

src_install() {
	INSTDIR="/opt/${MY_PN}"

	dodir "${INSTDIR}"
	insinto "${INSTDIR}"
	doins -r *

	echo "#!/bin/sh" > "${S}/keepass"
	echo "exec mono \"${INSTDIR}/${MY_PN}.exe\" \"\$@\"" >> "${S}/keepass"
	dobin keepass

	make_desktop_entry ${PN} ${MY_PN} ${MY_PN} Utility
}

pkg_preinst() {
	gnome2_icon_savelist;
}

pkg_postinst() {
	gnome2_icon_cache_update;
	einfo "Documentation has been installed to \"${INSTDIR}/${MY_PN}.chm\"."
	einfo "use app-text/xchm or any other chm viewer to read it."
}

pkg_postrm() {
	gnome2_icon_cache_update;
}
