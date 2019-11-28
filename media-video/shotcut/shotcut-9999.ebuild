# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/shotcut/shotcut-9999.ebuild,v 1.1 2014-08-31 13:19:13 brothermechanic Exp $

EAPI=6

inherit git-r3 qmake-utils

DESCRIPTION="A free, open source, cross-platform video editor"
HOMEPAGE="http://www.shotcut.org/"
EGIT_REPO_URI="https://github.com/mltframework/shotcut.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>=media-libs/mlt-6.6.0[ffmpeg,frei0r,qt5,sdl2,xml]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtx11extras:5
	dev-qt/qtsql:5
	dev-qt/qtwebkit:5
	dev-qt/qtwebsockets:5
	dev-qt/qtquickcontrols:5[widgets]
	dev-qt/qtnetwork:5
	dev-qt/qtxml:5
	dev-qt/qtopengl:5
	dev-qt/qtwidgets:5
	dev-qt/qtconcurrent:5
	dev-qt/qtmultimedia:5
	dev-qt/qtprintsupport:5
	media-video/ffmpeg
	media-libs/x264
	media-libs/libvpx
	media-sound/lame
	media-plugins/frei0r-plugins
	media-libs/ladspa-sdk
	"

RDEPEND="${DEPEND}"

src_prepare() {
	local mylrelease="$(qt5_get_bindir)/lrelease"
	"${mylrelease}" "${S}/src/src.pro" || die "preparing locales failed"
	default
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	insinto "/usr/share/${PN}/translations"
	doins translations/*.qm
	newicon "${S}"/icons/shotcut-logo-64.png "${PN}".png
	make_desktop_entry shotcut "Shotcut"
	einstalldocs
}
