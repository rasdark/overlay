# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Easy-to-use SNMPv1 and SNMPv2c MIB Browser written in QT4"
HOMEPAGE="http://qtmib.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"

inherit eutils flag-o-matic qt4-r2

KEYWORDS="amd64 x86"

RDEPEND="dev-qt/qtcore:4
	 net-analyzer/net-snmp"
DEPEND="${RDEPEND}"
 
S=${WORKDIR}/${P}

