# Copyright 2010-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils

DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://www.viber.com"
SRC_URI="http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb"

SLOT="0"
KEYWORDS=""
IUSE="pulseaudio +apulse"
REQUIRED_USE="apulse? ( !pulseaudio )"

QA_PREBUILT=opt/${PN}/${PN}

RESTRICT="mirror bindist strip"
RDEPEND="
        apulse? ( media-sound/apulse )
        pulseaudio? ( media-sound/pulseaudio )
"

S="${WORKDIR}"

src_unpack() {
	default_src_unpack
	unpack ./data.tar.xz
}

src_install(){
	doins -r opt usr

    if use apulse; then
        mv ${ED}/opt/${PN}/Viber ${ED}/opt/${PN}/${PN}-bin
        insinto opt/${PN}
        doins "${FILESDIR}/${PN}"
        fowners root:audio /opt/${PN}/${PN} /opt/${PN}/${PN}-bin
        fperms 755 /opt/${PN}/${PN} /opt/${PN}/${PN}-bin
        sed -i -e '/^Exec/s/Viber/viber/' ${ED}/usr/share/applications/viber.desktop
    else
        fperms 755 /opt/${PN}/Viber
    fi
}
