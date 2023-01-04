# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit eutils unpacker

MY_PV=$(ver_rs 3 -)

DESCRIPTION="Kerio VPN Client"
HOMEPAGE="http://www.kerio.com/"
LICENSE="custom:kerio-control-vpnclient"
SRC_URI="http://cdn.kerio.com/dwn/control/control-${MY_PV}/kerio-control-vpnclient-${MY_PV}-p1-linux-amd64.deb"
KEYWORDS="amd64"
SLOT="0"

S=${WORKDIR}

RDEPEND="
	dev-util/dialog
	virtual/libcrypt:="

QA_PREBUILT="*"

src_unpack() {
	unpack_deb ${A}
}

src_install()
{
	doinitd "${FILESDIR}/kerio-control-vpnclient"

	dosbin "./usr/sbin/kvpncsvc"

	doconfd "${FILESDIR}/conf.d/kerio-control-vpnclient"

	for lib in "./usr/lib/"*; do
		dolib.so "$lib"
	done

	insinto "/var/lib/kerio-control-vpnclient"
	insopts -m744
	doins "${FILESDIR}/kvpnc_conf"
}


pkg_postinst() {
    elog "You will need to set up your /etc/kerio-kvc.conf file before"
    elog "running kerio-control-vpnclient  for the first time. For set up  please run:"
    elog "/var/lib/kerio-control-vpnclient/kvpnc_conf configure"
}
