# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit flag-o-matic cmake-utils

DESCRIPTION="Plugins for net-im/qutim"
HOMEPAGE="http://www.qutim.org"

SRC_URI="http://www.qutim.org/dwnl/40/qutim-${PV}.tar.bz2"
S="${WORKDIR}/qutim-${PV}"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

PLUGINS="-adiumwebview aescrypto -antiboss antispam aspeller -awn \
	bearermanager -birthdayreminder blogimprover clconf +dbus dbusnotify emoedit \
	floaties highlighter histman hunspeller -indicator \
	kde +kineticpopups massmessaging multimediabackend nowplaying phonon \
	-qmlchat scriptapi sdl +unreadmessageskeeper urlpreview \
	weather -yandexnarod"

IUSE="${PLUGINS} debug"

RDEPEND="net-im/qutim:${SLOT}
	aescrypto? ( app-crypt/qca )
	aspeller? ( app-text/aspell )
	adiumwebview? ( dev-qt/qtwebkit )
	awn? ( dev-qt/qtdbus
		   gnome-extra/avant-window-navigator )
	dbus? ( >=dev-qt/qtdbus-4.6.0 )
	dbusnotify? ( >=dev-qt/qtdbus-4.6.0 )
	histman? ( dev-qt/qtsql )
	hunspeller? ( app-text/hunspell )
	indicator? ( dev-libs/libindicate-qt )
	kineticpopups? ( >=dev-qt/qtdeclarative-4.7.2 )
	multimediabackend? ( >=dev-qt/qtmultimedia-4.7.2 )
	qmlchat? ( >=dev-qt/qtdeclarative-4.7.2 )
	sdl? ( media-libs/sdl-mixer )
	phonon? ( media-libs/phonon )"

DEPEND="${RDEPEND}
	>=dev-util/cmake-2.6
	dev-util/pkgconfig"

PDEPEND="kde? ( kde-misc/qutim-kdeintegration:${SLOT}[debug?] )"

RESTRICT="debug? ( strip )"

CMAKE_USE_DIR="${S}/plugins"
CMAKE_IN_SOURCE_BUILD=1

src_configure() {
	if use debug ; then
		filter-flags -O* -f*
		append-flags -O1 -g -ggdb
	fi

	mycmakeargs=(
		-DQUTIM_ENABLE_ALL_PLUGINS=off
		$(cmake-utils_use aescrypto AESCRYPTO)
		$(cmake-utils_use antiboss ANTIBOSS)
		$(cmake-utils_use antispam ANTISPAM)
		$(cmake-utils_use aspell ASPELLER)
		$(cmake-utils_use adiumwebview ADIUMWEBVIEW)
		$(cmake-utils_use awn AWN)
		$(cmake-utils_use bearermanager BEARERMANAGER)
		$(cmake-utils_use birthdayreminder BIRTHDAYREMINDER)
		$(cmake-utils_use blogimprover BLOGIMPROVER)
		$(cmake-utils_use clconf CLCONF)
		$(cmake-utils_use dbus DBUSAPI)
		$(cmake-utils_use dbusnotify DBUSNOTIFICATIONS)
		$(cmake-utils_use emoedit EMOEDIT)
		$(cmake-utils_use floaties FLOATIES)
		$(cmake-utils_use histman HISTMAN)
		$(cmake-utils_use highlighter HIGHLIGHTER)
		$(cmake-utils_use hunspell HUNSPELLER)
		$(cmake-utils_use indicator INDICATOR)
		$(cmake-utils_use kineticpopups KINETICPOPUPS)
		$(cmake-utils_use kineticpopups QUICKPOPUP/DEFAULT)
		$(cmake-utils_use kineticpopups QUICKPOPUP/GLASS)
		$(cmake-utils_use massmessaging MASSMESSAGING)
		$(cmake-utils_use multimediabackend MULTIMEDIABACKEND)
		$(cmake-utils_use nowplaying NOWPLAYING)
		$(cmake-utils_use phonon PHONONSOUND)
		$(cmake-utils_use qmlchat QMLCHAT)
		$(cmake-utils_use qmlchat QMLCHAT/DEFAULT)
		$(cmake-utils_use sdl SDLSOUND)
		$(cmake-utils_use scriptapi SCRIPTAPI)
		$(cmake-utils_use unreadmessageskeeper UNREADMESSAGESKEEPER)
		$(cmake-utils_use urlpreview URLPREVIEW)
		$(cmake-utils_use weather WEATHER)
		$(cmake-utils_use yandexnarod YANDEXNAROD)
	)
	if use bearermanager ; then
		mycmakeargs+=( -DMOBILITY=ON )
	fi
	if use multimediabackend ; then
		mycmakeargs+=( -DMOBILITY=ON )
	fi
	if use adiumwebview ; then
		mycmakeargs+=( -DDATA/WEBVIEW=ON -DWEBKITSTYLE/MELWA=ON )
	fi

	cmake-utils_src_configure
}
