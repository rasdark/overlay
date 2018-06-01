# Copyright 2010-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils unpacker

DESCRIPTION="Unify interaction between desktop and field staff, host your data on-premise or in the cloud. "
HOMEPAGE="https://dlg.im/"
SRC_URI="
        amd64? ( https://dialog-app-desktop.s3.amazonaws.com/${PN}-messenger-linux-amd64-latest.deb -> ${P}.deb )
"


SLOT="0"
KEYWORDS="amd64"
IUSE="pulseaudio +apulse"
REQUIRED_USE="apulse? ( !pulseaudio )"

QA_PREBUILT="*"

RESTRICT="mirror bindist strip"
RDEPEND="
        apulse? ( media-sound/apulse )
        pulseaudio? ( media-sound/pulseaudio )
"

S="${WORKDIR}"


src_unpack() {
    unpack_deb ${A}
}

src_install(){
	doins -r opt usr
    mv ${ED}/opt/Dialog\ Messenger ${ED}/opt/Dialog || die "Can't change 'Dialog Messenger' on 'Dialog'"
    sed -i -e '/^Exec/s/[[:space:]]*\<Messenger\>//' ${ED}/usr/share/applications/${PN}-messenger.desktop
    fperms 755 /opt/Dialog/dialog-messenger
}
