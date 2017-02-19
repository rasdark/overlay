# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit rpm bash-completion-r1 versionator

DESCRIPTION="Mail.Ru Cloud"
HOMEPAGE="http://cloud.mail.ru/"
SRC_URI="
    x86?   ( https://linuxdesktopcloud.cdnmail.ru/rpm/default/mail.ru-cloud-fedora-$(get_version_component_range 2-3)-$(get_version_component_range 1-1).i386.rpm )
    amd64? ( https://linuxdesktopcloud.cdnmail.ru/rpm/default/mail.ru-cloud-fedora-$(get_version_component_range 2-3)-$(get_version_component_range 1-1).x86_64.rpm )
    "

DEPEND=""
RDEPEND="${DEPEND}"

SLOT="0"
KEYWORDS="x86 amd64"

RESTRICT="mirror"
QA_PRESTRIPPED="/usr/bin/${PN}"

S=${WORKDIR}

src_unpack() {
    rpm_src_unpack "${A}"
    cd "${S}"
}

src_install() {
    exeinto /usr/bin
    doexe usr/bin/cloud || die

    insinto /usr/share
    doins -r usr/share/*
}
