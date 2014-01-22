# Copyright 2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"
inherit cmake-utils fdo-mime git-2

DESCRIPTION="Very simple GUI for text translation (like google translate)."
HOMEPAGE="https://github.com/flareguner/litetran"
EGIT_REPO_URI="https://github.com/flareguner/litetran.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND=">=dev-util/cmake-2.8.10
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtmultimedia:5
		dev-qt/linguist-tools:5
		dev-qt/qtx11extras:5"
DEPEND="${RDEPEND}"
#PATCHES=( "${FILESDIR}/${P}_gcc47.patch" )

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
