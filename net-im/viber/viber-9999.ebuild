# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils
DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://www.viber.com"
SRC_URI="http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb"

SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT="strip"
INST="/opt/${PN}"
S="${WORKDIR}"

src_unpack() {
	default_src_unpack
	unpack ./data.tar.gz
	epatch "${FILESDIR}/00-desktop.patch"
}

src_install(){
	insinto "${INST}"
	doins -r usr/share/${PN}/*
	insinto "/usr/share/applications"
	doins usr/share/applications/viber.desktop
	insinto "/usr/share/pixmaps"
	doins usr/share/pixmaps/viber.png

# for creating launcher.db from user.
	fperms 777 $INST/${PN}
#	
	fperms 755 ${INST}/Viber.sh
	fperms 755 ${INST}/Viber
}

pkg_prerm(){
	[[ -e "${ROOT}usr/share/${PN}/launcher.db" ]] && rm -rf "${ROOT}usr/share/${PN}/launcher.db"
}