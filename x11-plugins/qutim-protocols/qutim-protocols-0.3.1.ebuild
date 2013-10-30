# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils flag-o-matic cmake-utils

DESCRIPTION="Protocols for net-im/qutim"
HOMEPAGE="http://www.qutim.org"

SRC_URI="http://www.qutim.org/dwnl/40/qutim-${PV}.tar.bz2"
S="${WORKDIR}/qutim-${PV}"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

PROTOCOLS="-astral +icq irc +jabber -libpurple mrim vkontakte"

IUSE="${PROTOCOLS} debug"

RDEPEND="net-im/qutim:${SLOT}
	astral? ( net-libs/telepathy-qt )
	jabber? ( >=net-libs/jreen-1.1.0
			  >=app-crypt/qca-gnupg-2.0 )
	libpurple? ( net-im/pidgin )
	"

DEPEND="${RDEPEND}"

RESTRICT="debug? ( strip )"

CMAKE_USE_DIR="${S}/protocols"
CMAKE_IN_SOURCE_BUILD=1

src_configure() {
	if use debug ; then
		filter-flags -O* -f*
		append-flags -O1 -g -ggdb
	fi
	mycmakeargs=(
		-DQUTIM_ENABLE_ALL_PLUGINS=off
		$(cmake-utils_use astral ASTRAL)
		$(cmake-utils_use icq OSCAR)
		$(cmake-utils_use icq XSTATUS)
		$(cmake-utils_use icq IDENTIFY)
		$(cmake-utils_use irc IRC)
		$(cmake-utils_use jabber JABBER)
		$(cmake-utils_use jabber SYSTEM_JREEN)
		$(cmake-utils_use libpurple QUETZAL)
		$(cmake-utils_use mrim MRIM)
		$(cmake-utils_use vkontakte VKONTAKTE)
		$(cmake-utils_use vkontakte PHOTOALBUM)
		$(cmake-utils_use vkontakte VPHOTOALBUM/DEFAULT)
		$(cmake-utils_use vkontakte WALL)
	)
	cmake-utils_src_configure
}
